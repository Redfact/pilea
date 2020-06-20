Rails.application.routes.draw do
  root 'coins#index'
  get '/project', to: 'statics#project'
  get '/team', to: 'statics#team'

  resources :coins, only: [:show]
  resources :users, only: [:show, :edit, :update]
  resources :selections
  devise_for :users

  namespace :admin do
    root "users#index"
    resources :users
    resources :coins
    resources :values
  end
end