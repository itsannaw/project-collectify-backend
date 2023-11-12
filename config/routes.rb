# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, param: :_username
  post '/users', to: 'users#create'
  get '/users', to: 'users#index'
  get '/me', to: 'users#me'
  post '/auth/login', to: 'authentication#login'
  post '/users/block', to: 'users#block_users'
  post '/users/unblock', to: 'users#unblock_users'
  post '/users/delete', to: 'users#delete_users'
  post '/collection', to: 'collections#create'
  get '/categories', to: 'categories#index'
  get '/*a', to: 'application#not_found'
  get 'up' => 'rails/health#show', as: :rails_health_check
end
