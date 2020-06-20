Rails.application.routes.draw do
  root 'coins#index'
  get '/team', to: 'statics#team'
  get '/project', to: 'statics#project'

  resources :coins, only: [:show]
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :selections

  namespace :admin do
    resources :users
    resources :coins
    resources :values
    root to: "users#index"
  end
end