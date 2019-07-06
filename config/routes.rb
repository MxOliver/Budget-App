Rails.application.routes.draw do

  get 'budget/index'
  
  get 'budget/edit'
  
  root 'budget#index'
end
