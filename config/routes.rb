Rails.application.routes.draw do
  root to: 'static#home'
  resources :workouts
  resources :users
  resources :sessions
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  get "/register", to: "users#new", as: "register"
  post "register", to: "users#create"
  get "/logout", to: "sessions#destroy"
  
  # get 'users/show'
  # get 'users/new'
  # post 'users/new'
  # get 'users/create'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
