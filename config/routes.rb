Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :coins
      resources :selections
      resources :values

      root to: "users#index"
    end
  root 'coins#index'
  get '/team', to: 'statics#team'
  get '/project', to: 'statics#project'
  resources :selections
  resources :coins, only: [:show]
  devise_for :users
  resources :users, only: [:show, :edit, :update]
end