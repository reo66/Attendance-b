class UsersController < ApplicationController
  before_action :set_user,only:[:show, :edit, :update]
  before_action :logged_in_user,only: [:index, :show, :edit, :update]
  before_action :correct_user,only:[:edit, :update]
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
  end  
  
  def show
    # @userにUserテーブルのidが受け取った値である(params[:id])のレコードを見つけて代入
    @user = User.find(params[:id])
    @first_day = Date.current.beginning_of_month
    @last_day = @first_day.end_of_month
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user # 保存成功後、ログインします。
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end  
  end
  
  
  def edit
   @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
     if @user.update_attributes(user_params)
       flash[:success] = "ユーザー情報を更新しました"
       redirect_to @user
     else
      render :edit      
     end
  end 
  
def edit_basic_info
  @user = User.find(params[:id])
end 

def update_basic_info
  @user = User.find(params[:id])
end 


   
  private
  
  def user_params
   params.require(:user).permit(:name, :email, :password, :password_Confirmation)
  end  
  
  def basic_info_params
      params.require(:user).permit(:basic_time, :work_time)
  end
  
  def set_user
    @user = User.find(params[:id])
  end  
  
  # ログインしているか？
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end
  
  def correct_user
    # アクセスしたユーザーが現在ログインしているユーザーか
    redirect_to(root_url) unless current_user?(@user)
  end
end  

