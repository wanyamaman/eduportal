Rails.application.routes.draw do
  resources :states
  resources :locations
  resources :schools
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
