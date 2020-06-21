Rails.application.routes.draw do
  root 'coins#index'
  get '/project', to: 'statics#project'
  get '/team', to: 'statics#team'

  devise_for :users
  resources :selections
  resources :coins, only: [:show]
  resources :users, only: [:show, :edit, :update]

  namespace :admin do
    root "users#index"
    resources :users
    resources :coins
    resources :values
  end
end