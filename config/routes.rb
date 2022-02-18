Rails.application.routes.draw do

  # get 'categories/new'
  # get 'categories/create'
  # get 'categories/edit'
  # get 'categories/update'
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

  #CATEGORIES
  get ":username/category/new", to: "categories#new", as: :new_category
  post ":username/category/new", to: "categories#create", as: :create_category
  get ":username/category/:category_id/edit", to: "categories#edit", as: :edit_category
  patch ":username/category/:category_id/edit", to: "categories#update", as: :update_category

end
