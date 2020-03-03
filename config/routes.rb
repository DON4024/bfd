Rails.application.routes.draw do
  devise_for :users
  root to: "pictures#index"
  resources :pictures do
   resources :comments, only: :create
  end
  resources :users, only: [:new, :create, :edit, :update, :show]
  
end

