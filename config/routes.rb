Rails.application.routes.draw do
  get 'attendances/def'

  get 'attendances/edit_one_month'

 root 'static_pages#top'
#  新規登録
  get '/signup', to: 'users#new'
#   ログインページ
  get '/login' , to: 'sessions#new'
  # ログイン
  post '/login' , to: 'sessions#create'
  # ログアウト
  delete '/logout', to: 'sessions#destroy'
  
  resources :users do
    member do
      
      get 'edit_basic_info'
      patch 'update_basic_info'
      # 勤怠編集
      get 'attendances/edit_one_month'
    end
  end

end
