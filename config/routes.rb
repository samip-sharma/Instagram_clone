Rails.application.routes.draw do
  resources :photos
  # resources :follows
  # resources :auth
  resources :users

  get "/login", to: "auth#new"
  post "/auth", to:"auth#create"
  delete "/auth", to:"auth#destroy"
post "/users/search", to:"users#search", as: "user_search"
  get "/follow/:id/new", to:"follows#new"
  get "/follow/following", to:"follows#following"
  get "/follow/followers", to:"follows#followers"
  get "/follow/:id/show", to:"follows#show"
  delete "/follow/:id", to:"follows#destroy"
  post "/pp/:id/new", to:"users#upload_pp" , as: "upload_pp"
  post "/photos/:id/likes", to:"photos#like" , as: "like_post"
  get "follow/:id/image", to: "follows#showimage", as: "display_pic"





  # get '/login', to: "users#login", as: "login"
  # get '/upload', to: "users#upload", as: "upload"
  # post '/verify_login', to: "users#verify_login"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
