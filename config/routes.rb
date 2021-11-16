Rails.application.routes.draw do
  root to: 'static#home'
  resources :workouts
  resources :users
  get "/login", to: "users#login", as: "login"
  
  
  # get 'users/show'
  # get 'users/new'
  # get 'users/create'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
