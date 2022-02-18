Rails.application.routes.draw do

  # get 'users/index'
  # get 'users/new'
  # get 'users/create'
  # get 'users/update'

  # ROOT
  root "landings#index"
  
  #SIGNUP
  get "signup", to: "users#new"
  post "signup", to: "users#create"

  #LOGIN
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"

  #USERS
  get ":username", to: "users#index", as: :index_user
  get ":username/edit", to: "users#edit", as: :edit_user
  patch ":username/edit", to: "users#update", as: :update_user

end
