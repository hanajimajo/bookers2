Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get "home/about" => "homes#about"
  # 不必要なルートは随時削除
  resources :books
  resources :users

end
