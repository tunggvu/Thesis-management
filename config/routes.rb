Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "theses#index"

  resources :users
  resources :theses
  resources :tasks
  resources :comments

  namespace :admin do
    root "static_pages#home"
    get "/theses_type", to: "static_pages#home"
    resources :users
    resources :tasks
    resources :comments
    resources :theses do
      member do
        patch :approved
        patch :rejected
      end
    end
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end

