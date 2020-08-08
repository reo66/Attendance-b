class UsersController < ApplicationController
  before_action :set_user,only:[:show, :edit,:update,:edit_basic_info,:update_basic_info]
  before_action :logged_in_user,only: [:index, :show]
  before_action :correct_user,only:[:edit, :update]
  before_action :admin_user, only: [:destroy, :edit_basic_info, :update_basic_info]
  before_action :set_one_month,only: :show
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
  end  
  
  def show
    # @userにUserテーブルのidが受け取った値である(params[:id])のレコードを見つけて代入
    @first_day = Date.current.beginning_of_month
    @last_day = @first_day.end_of_month
  end
  
  def create
    if @user.save
      log_in @user # 保存成功後、ログインします。
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end  
  end
  
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to @user
    else
      render :edit      
    end
  end 
  
  def edit_basic_info
  end  
   

  def update_basic_info
    if @user.update_attributes(basic_info_params)
      flash[:success] = "更新に成功しました"
    else
      flash[:danger] = "更新は失敗しました。" + @user.errors.full_messages.join("<br>")
    end
      redirect_to @user
  end
  


   
  private
  
  def user_params
   params.require(:user).permit(:name, :email, :department, :password, :password_Confirmation)
  end  
  
  def basic_info_params
  params.require(:user).permit(:basic_time, :work_time)
  end
end  
