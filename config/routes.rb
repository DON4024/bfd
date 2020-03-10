Rails.application.routes.draw do
  devise_for :users
  root to: "pictures#index"
  resources :pictures do
    post "add", to: "favorites#create"
    resources :comments, only: :create
  end
  resources :users, only: [:new, :create, :edit, :update, :show] 
  resources :favorites, only: [:destroy]
  resources :relationships, only: [:create, :destroy]

  namespace :api do
    resources :pictures, only: :index, defaults: { format: 'json' }
    resources :rankings, only: :index, defaults: { format: 'json' }
  end
end

