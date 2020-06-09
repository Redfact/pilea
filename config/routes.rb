Rails.application.routes.draw do
  get 'users/show'
  root 'coins#index'
  resources :coins, only: [:show]
  resources :users, only: [:show]
  devise_for :users
end
