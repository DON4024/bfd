Rails.application.routes.draw do
  devise_for :users
  root to: "pictures#index"
  resources :pictures do
    post "add", to: "favorites#create"
    
    resources :comments, only: :create
  end
  resources :users, only: [:new, :create, :edit, :update, :show] do
    post "add", to: "favoriteusers#create"
  end
  resources :favorites, only: [:destroy]
  resources :favoriteusers, only: [:destroy]
  resources :relationships, only: [:create, :destroy]
end

