class UsersController < ApplicationController
  
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
  
  private
  
  def user_params
     params.require(:user).permit(:name, :email, :password, :password_Confirmation)
  end  
  
  def basic_info_params
      params.require(:user).permit(:department, :basic_time, :work_time)
  end
  
end

