Rails.application.routes.draw do

  get 'users/index'
  get 'users/new'
  get 'users/create'
  get 'users/update'
  root "landings#index"

  
end
