class SessionsController < ApplicationController
  
 # ログインページ
 def new
 end
 
 # ログイン

  
  
 def create
    user = User.find_by(email: params[:session][:email].downcase)
     if user && user.authenticate(params[:session][:password])
       log_in user
       params[:session][:remember_me] == '1' ? remember(user) : forget(user)
       remember user
       redirect_to user
     else
       flash.now[:danger] = '認証に失敗しました。'
      # newアクションにレンダリング
       render :new
     end
 end

def destroy
    log_out
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
end
 
 
end