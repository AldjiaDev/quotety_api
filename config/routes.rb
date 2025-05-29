Rails.application.routes.draw do
  get "pages/welcome"
  # 🌐 Page d'accueil
  root "quotes_web#index"

  # ✅ Pages HTML (vues utilisateur)
  get "quotes", to: "quotes_web#index", as: :quotes
  get "categories", to: "quotes_web#index"
  get "categories/:category", to: "quotes_web#category", as: :category_quotes
  get "about", to: "quotes_web#about", as: :about

  # ❤️ Favoris (interface utilisateur)
  get "favorites", to: "favorites_web#index", as: :favorites
  post "favorites", to: "favorites_web#create"
  delete "favorites/:id", to: "favorites_web#destroy", as: :remove_favorite

  # 👤 Authentification HTML
  get "login", to: "sessions#new", as: :login
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: :logout
  get "me", to: "users#show", as: :me

  # 🩺 Health check
  get "up", to: "rails/health#show", as: :rails_health_check

  get "authors", to: "authors_web#index", as: :authors
  get "authors/:id", to: "authors_web#show", as: :author_quotes
  get "quotes/search", to: "quotes_web#search", as: :search_quotes

  get "admin", to: "admin_dashboard#index", as: :admin_dashboard

  get "register", to: "users#new", as: :register
  post "register", to: "users#create"

  get "welcome", to: "pages#welcome", as: :welcome



# Pour gérer les ressources
  namespace :admin do
  resources :quotes, only: [:index, :new, :create]
  resources :authors, only: [:new, :create]
  resources :categories, only: [:new, :create]
end



  # 🧪 API RESTful
  namespace :api do
    namespace :v1 do
      # Citations
      resources :quotes, only: [:index, :show] do
        collection { get :search }
      end

      # Auteurs
      resources :authors, only: [:index, :show] do
        collection { get :search }
      end

      # Catégories
      resources :categories, only: [:index, :show] do
        collection { get :search }
      end

      # Favoris (API JSON)
      resources :favorites, only: [:index, :create, :destroy]

      # Authentification API
      post "register", to: "auth#register"
      post "login", to: "auth#login"
      get "me", to: "auth#me"
      delete "logout", to: "auth#logout"
    end
  end
end
