Rails.application.routes.draw do

  resources :expenses
  resources :savings

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  root 'budget#index'
end
