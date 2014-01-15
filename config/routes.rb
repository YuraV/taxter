Taxter::Application.routes.draw do

  devise_for :users, path_prefix: "My"

  resources :users

  resources :roles

  root :to => 'users#index'




end
