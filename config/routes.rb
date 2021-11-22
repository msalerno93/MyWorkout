Rails.application.routes.draw do
  root to: 'static#home'

  
 


  resources :users , only: [:edit, :update, :show, :destroy ] do 
    resources :workouts, only: [:new, :create, :edit, :show]
  end

  resources :workouts, only: [ :update , :index, :destroy]

  
  get "/register", to: "users#new", as: "register"
  post "register", to: "users#create"

 
  post "/login", to: "sessions#create"
  get "/login", to: "sessions#new"
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
