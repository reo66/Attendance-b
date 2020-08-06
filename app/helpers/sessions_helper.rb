module SessionsHelper
  
  # メソッドlog_inに引数userを指定=userでログインしている
  def log_in(user)
# sessionにユーザー情報を入れて、user.idを自動で生成している=ログインしている状態
    session[:user_id] = user.id
  end
  
  # userモデルの永続セッションを記憶する
  def remember(user)
    # userオブジェクトにremenberメソッドを施す
    user.remember
    # 暗号化した20年期限のremember_tokenであるcookiesカラム持つ[:user_id]キーにuser_idをいれる
    cookies.permanent.signed[:user_id] = user.id
    # 20年期限のremember_tokenであるcookiesカラム持つ[:remember_token]キーにをuser.remember_tokenをいれる
    cookies.permanent[:remember_token] = user.remember_token
  end  
  # userモデルの永続セッションを破棄
  def forget(user)
    # userオブジェクトにforgetメソッドを施す
    user.forget
    # user_idに入っているcookiesを消す
    cookies.delete(:user_id)
    # user.remember_tokenに入ってるcookiesを消す
    cookies.delete(:remember_token)
  end
  
def current_user
    # user_id がsession[:user_id]であること前提
   if (user_id = session[:user_id])
      # まず@current_userを評価。次にUser.find_by(id: user_id)は空のuserを示すか？を評価
      @current_user ||= User.find_by(id: user_id)
      # 上記でなければ、 user_id がcookies.signed[:user_id]であることを評価
   elsif (user_id = cookies.signed[:user_id])
      # Userからidカラムの暗号化したcookiesの[:user_id]を見つける
      user = User.find_by(id: user_id)
  # cookie.signed[:user_id]で検索したuserが存在し、かつ、そのuserのremember_digestとcookie[:remember_token]が一致
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
   end
end

  def current_user?(user)
    user == current_user
  end  

  
  # trueかfalseを返すメソッド
  def logged_in?
    # current_userが空でなければ(!は否定演算子)
    !current_user.nil?
  end  
    
    
    
  
  def log_out
    # sessionで生成した、user.idを消去
    forget(current_user)
    session.delete(:user_id)
    # 現在のuserが空になる
    @current_user = nil
  end  
end
