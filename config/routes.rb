Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#show"
  get "sessions/new"

  resources :users

  get "/dashboard", to: "home_pages#dashboard"
  get "/user", to: "home_pages#user"
  get "/table_list", to: "home_pages#table_list"
  get "/typography", to: "home_pages#typography"
  get "/icon", to: "home_pages#icon"

  get  "/login",   to: "sessions#new"
  post  "/login",   to: "sessions#create"
  delete  "/logout",  to: "sessions#destroy"
end
