Rails.application.routes.draw do
  root 'coins#index'
  resources :coins, only: [:show]
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :admin, only: [:index]
end
