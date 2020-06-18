Rails.application.routes.draw do
  get 'selections/create'
  get 'selections/destroy'
  root 'coins#index'
  resources :coins, only: [:show]
  devise_for :users
  resources :users, only: [:show, :edit, :update]

  resources :coins do
    member do
      get 'like', to: "coin#like"
      get 'unlike', to: "coin#unlike"
    end
  end
end
