Rails.application.routes.draw do
  root 'coins#index'
  resources :selections
  resources :coins, only: [:show]
  devise_for :users
  resources :users, only: [:show, :edit, :update]
end
