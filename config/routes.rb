Rails.application.routes.draw do
  resources :schools
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
