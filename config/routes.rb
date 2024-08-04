# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check
  root to: 'visitors#index'
  devise_for :users
  resources :events
  resources :shopping_cart, controller: 'shopping_carts'
end
