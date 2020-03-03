Rails.application.routes.draw do
  devise_for :users
  root to: "pictures#index"
  resources :pictures do
    post "add", to: "favorites#create"
    resources :comments, only: :create
  end
  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :favorites, only: [:destroy]
end

