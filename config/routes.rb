# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, param: :_username
  post '/users', to: 'users#create'
  get '/users', to: 'users#index'
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  get 'up' => 'rails/health#show', as: :rails_health_check
end
