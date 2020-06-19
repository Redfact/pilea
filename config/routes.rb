Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :coins
      resources :selections
      resources :values

      root to: "users#index"
    end
  root 'coins#index'
  resources :selections
  resources :coins, only: [:show]
  devise_for :users
  resources :users, only: [:show, :edit, :update]
end