# frozen_string_literal: true

Rails.application.routes.draw do
  post '/auth/login', to: 'authentication#login'

  # users
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

  # collection
  post '/collection', to: 'collections#create'
  get '/all_collections', to: 'collections#all_collections'
  get '/large_collections', to: 'collections#large_collections'
  get '/collections', to: 'collections#index'
  get '/collection/:id', to: 'collections#show'
  put '/collection/:id', to: 'collections#update'
  delete '/collection/:id', to: 'collections#destroy'

  # categories
  get '/categories', to: 'categories#index'

  # items
  post '/items', to: 'items#create'
  get '/items/:collection_id', to: 'items#index'
  get '/item/:id', to: 'items#show'
  get '/all_items', to: 'items#all_items'
  put '/items/:id', to: 'items#update'
  delete '/item/:id', to: 'items#destroy'
  get '/liked_items', to: 'items#liked_items'


  # tags
  get '/tags', to: 'tags#index'

  # like
  get '/like/:item_id', to: 'likes#create'
  get '/dislike/:item_id', to: 'likes#destroy'

  # rating
  post '/rating/:collection_id', to: 'ratings#create'

  get '/*a', to: 'application#not_found'
  get 'up' => 'rails/health#show', as: :rails_health_check
end
