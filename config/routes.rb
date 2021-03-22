Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  resources :expenses, only: [:new, :create, :edit, :update, :destroy]
  resources :category, only: :index
  resources :month, only: :index
  resources :users, only: :show
end
