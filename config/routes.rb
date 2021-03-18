Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  resources :expenses, only: [:index, :new, :create]
  resources :category, only: :index
  resources :month, only: :index
end
