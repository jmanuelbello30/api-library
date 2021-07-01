Rails.application.routes.draw do
  resources :users, only: [:create, :index, :show, :update, :destroy]
  resources :libraries, only: [:create, :index, :show, :update, :destroy]
  resources :overdrafts, only: [:create]
  resources :returns, only: [:create]
end
