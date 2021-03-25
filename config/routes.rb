Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  resources :expenses, only: [:new, :create, :edit, :update, :destroy]
  resources :category, only: :index
  resources :month, only: :index
  resources :users do
    member do
      get :following, :followers
    end
    collection do
      get 'search'
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :searches, only: :index
  resources :confirms, only: :index
  resources :friends, only: [:index, :show]
end
