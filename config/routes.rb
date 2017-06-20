Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :inquiries, only: :create
  resources :locations, only: :index
  resources :schools, only: [:index, :show]
  root to: 'visitors#index'
  devise_for :users
end
