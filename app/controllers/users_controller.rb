class UsersController < ApplicationController
  
  def new
    @user = User.new
  end  
  
  def show
    # @userにUserテーブルのidが受け取った値である(params[:id])のレコードを見つけて代入
    @user = User.find(params[:id])
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    else
    flash.now[:danger] = '認証に失敗しました。'
    render :new
    end
  end  
  
end
