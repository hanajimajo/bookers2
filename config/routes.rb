Rails.application.routes.draw do

  get 'users/show'
  devise_for :users
  root 'homes#top'
  get "homes/about" => "homes#about"
  # 不必要なルートは随時削除
  resources :books
  resources :users


end
