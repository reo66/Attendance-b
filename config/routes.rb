Rails.application.routes.draw do
  root 'static_pages#top'
#   ログインページ
  get '/signup', to: 'users#new'

end
