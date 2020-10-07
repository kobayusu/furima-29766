Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
  post "/items/new"
  get "/items/show"
end