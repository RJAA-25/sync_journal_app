Rails.application.routes.draw do
  
  # ROOT
  root "landings#index"
  
  #SIGNUP
  get "signup", to: "users#new"
  post "signup", to: "users#create"

  #LOGIN
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"

  #LOOGOUT
  get "logout", to: "sessions#destroy"

  #USERS
  get ":username", to: "users#index", as: :index_user
  get ":username/edit", to: "users#edit", as: :edit_user
  patch ":username/edit", to: "users#update", as: :update_user

  #CATEGORIES
  get ":username/category/new", to: "categories#new", as: :new_category
  post ":username/category/new", to: "categories#create", as: :create_category
  get ":username/category/:category_id/edit", to: "categories#edit", as: :edit_category
  patch ":username/category/:category_id/edit", to: "categories#update", as: :update_category

  #TASKS
  get ":username/category/:category_id/task/new", to: "tasks#new", as: :new_task 
  post ":username/category/:category_id/task/new", to: "tasks#create", as: :create_task
  get ":username/category/:category_id/task/:task_id/edit", to: "tasks#edit", as: :edit_task
  patch ":username/category/:category_id/task/:task_id/edit", to: "tasks#update", as: :update_task
  get ":username/category/:category_id/task/:task_id/delete", to: "tasks#destroy", as: :destroy_task

end
