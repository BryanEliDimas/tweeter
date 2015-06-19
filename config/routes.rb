Rails.application.routes.draw do
  get 'signin' => 'session#new', as: :sign_in

  post 'signin' => 'session#create', as: :auth

  delete 'signout' => 'session#delete', as: :sign_out

  get 'signup' => 'user#new', as: :sign_up

  post 'signup' => 'user#create', as: :users

  get 'dashboard/:id' => 'tweets#dashboard', as: :dashboard

  get 'users/:id' => 'user#show', as: :user

  post 'tweets' => 'tweets#create', as: :tweets

  post '/follow/:id' => 'user#follow', as: :follow

  post 'unfollow' => 'user#unfollow', as: :unfollow

  root 'tweets#index'

  end
