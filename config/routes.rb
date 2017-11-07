Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#show"
  get "sessions/new"

  resources :users
  resources :theses
  resources :tasks

  get  "/login",   to: "sessions#new"
  post  "/login",   to: "sessions#create"
  delete  "/logout",  to: "sessions#destroy"
end
