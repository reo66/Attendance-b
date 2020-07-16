Rails.application.routes.draw do
 root 'static_pages#top'
#  新規登録
  get '/signup', to: 'users#new'
  get 'login' , to: 'sessions#'
  
  resources :users

end
