Rails.application.routes.draw do
  resources :photos
  # resources :follows
  # resources :auth
  resources :users

  get "/login", to: "auth#new"
  post "/auth", to:"auth#create"
  delete "/auth", to:"auth#destroy"
  get "/users/search", to:"users#search", as: "user_search"
  get "/follow/:id/new", to:"follows#new"



  # get '/login', to: "users#login", as: "login"
  # get '/upload', to: "users#upload", as: "upload"
  # post '/verify_login', to: "users#verify_login"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
