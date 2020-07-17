class SessionsController < ApplicationController
  
 # ログインページ
 def new
 end
 
 # ログイン
 def create
  # newアクションにレンダリング
  render :new
 end
 
end
 