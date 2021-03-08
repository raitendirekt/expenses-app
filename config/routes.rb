Rails.application.routes.draw do
  get 'expenses/index'
  root to: "expenses#index"
end
