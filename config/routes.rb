# frozen_string_literal: true

Rails.application.routes.draw do
  post '/auth/login', to: 'authentication#login'

  #users
  post '/users', to: 'users#create'
  get '/users', to: 'users#index'
  get '/me', to: 'users#me'
  post '/users/block', to: 'users#block_users'
  post '/users/unblock', to: 'users#unblock_users'
  post '/users/delete', to: 'users#delete_users'
  post '/users/set_admin', to: 'users#set_admin'
  post '/users/unset_admin', to: 'users#unset_admin'
  delete '/users/logout', to: 'users#destroy'
  post '/create_avatar', to: 'users#create_avatar'

  #collection
  post '/collection', to: 'collections#create'
  get '/collections', to: 'collections#index'
  get '/collection/:id', to: 'collections#show'

  #categories
  get '/categories', to: 'categories#index'
  get '/*a', to: 'application#not_found'
  get 'up' => 'rails/health#show', as: :rails_health_check
end
