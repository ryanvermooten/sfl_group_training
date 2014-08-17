Rails.application.routes.draw do
  resources :groups

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
