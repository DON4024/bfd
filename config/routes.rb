Rails.application.routes.draw do
  devise_for :users
  root to: "pictures#index"
  resources :pictures
  resources :users, only: [:new, :create, :edit, :update, :show]
  
end

