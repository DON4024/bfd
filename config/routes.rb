Rails.application.routes.draw do
  devise_for :users
  root to: "pictures#index"
  resources :pictures, except: :index
  resources :users, only: [:edit, :update, :show]
  
end

