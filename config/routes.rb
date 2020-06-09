Rails.application.routes.draw do
  root 'coins#index'
  resources :coins, only: [:show]
  resources :users, only: [:show]
  devise_for :users
end
