Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only:[:index ,:new, :create, :destroy, :edit, :update, :show]
  post "/items/new"
  get "/items/show"
end