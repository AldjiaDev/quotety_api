Rails.application.routes.draw do
  root "quotes_web#index"

  # Pages HTML
  get "quotes", to: "quotes_web#all", as: :quotes
  get "categories", to: "quotes_web#index"
  get "categories/:category", to: "quotes_web#category", as: :category_quotes
  get "about", to: "quotes_web#about", as: :about
  get "quotes/:id/print", to: "quotes_web#print", as: :print_quote
  get "quotes/:id", to: "quotes_web#show", as: :quote



  # Favoris
  get "favorites", to: "favorites_web#index", as: :favorites
  post "favorites", to: "favorites_web#create"
  delete "favorites/:id", to: "favorites_web#destroy", as: :remove_favorite

  # Authentification HTML
  get "login", to: "sessions#new", as: :login
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: :logout

  get "register", to: "users#new", as: :register
  post "register", to: "users#create"
  post "users", to: "users#create"
  get "me", to: "users#show", as: :me

  # Navigation
  get "authors", to: "authors_web#index", as: :authors
  get "authors/:id", to: "authors_web#show", as: :author_quotes
  get "quotes/search", to: "quotes_web#search", as: :search_quotes

  get "welcome", to: "pages#welcome", as: :welcome
  get "up", to: "rails/health#show", as: :rails_health_check

  # Admin
  get "admin", to: "admin_dashboard#index", as: :admin_dashboard
  namespace :admin do
    resources :quotes, only: [:index, :new, :create]
    resources :authors, only: [:new, :create]
    resources :categories, only: [:new, :create]
  end

  # API JSON
  namespace :api do
    namespace :v1 do
      resources :quotes, only: [:index, :show] do
        collection { get :search }
      end
      resources :authors, only: [:index, :show] do
        collection { get :search }
      end
      resources :categories, only: [:index, :show] do
        collection { get :search }
      end
      resources :favorites, only: [:index, :create, :destroy]

      post "register", to: "auth#register"
      post "login", to: "auth#login"
      get "me", to: "auth#me"
      delete "logout", to: "auth#logout"
    end
  end
end
