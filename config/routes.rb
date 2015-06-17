Rails.application.routes.draw do
  get 'signin' => 'session#new', as: :sign_in

  post 'signin' => 'session#create', as: :auth

  delete 'signout' => 'session#delete', as: :sign_out

  get 'signup' => 'user#new', as: :sign_up

  post 'signup' => 'user#create', as: :users

  get 'dashboard/:id' => 'tweets#dashboard', as: :dashboard

  root 'tweets#index'

  end
