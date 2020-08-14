class UsersController < ApplicationController
  before_action :set_user,only:[:show, :edit,:update,:destroy,:edit_basic_info,:update_basic_info]
  before_action :logged_in_user,only: [:index,:edit,:update,:destroy,:edit_basic_info, :update_basic_info]
  before_action :correct_user,only:[:edit,:update]
  before_action :admin_user, only: [:index,:destroy,:edit_basic_info, :update_basic_info]
  before_action :set_one_month,only: :show
  # before_action :admin_or_correct_user,only: :show
  
  def index
   @users =User.paginate(page: params[:page]).where("name LIKE ?", "%#{params[:search]}%")
  end  

  def new
    @user = User.new
  end  
  
  def show
    # userの1ヶ月の勤怠データの中で、出勤時間が空の状態でない数を@worked_sumに代入
    @worked_sum = @attendances.where.not(started_at: nil).count
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
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to @user
    else
      render :edit      
    end
  end 
  
  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
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