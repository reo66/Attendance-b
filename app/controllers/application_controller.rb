class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  $days_of_the_week = %w{日 月 火 水 木 金 土}
  
  
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
