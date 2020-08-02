Rails.application.routes.draw do
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
    end
  end

end
