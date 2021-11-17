Rails.application.routes.draw do
  root to: 'static#home'
  resources :workouts
  resources :users
  resources :sessions
  get "/login", to: "users#login", as: "login"
  get "/new", to: "users#new", as: "new"
  
  
  # get 'users/show'
  # get 'users/new'
  # post 'users/new'
  # get 'users/create'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
