Rails.application.routes.draw do
  root "quotes_web#index"

  # Vue HTML
  get "categories", to: "quotes_web#index"
  get 'categories/:category', to: 'quotes_web#category', as: :category_quotes
  get '/about', to: 'quotes_web#about', as: :about # <-- Déplacée ici
  resources :favorites, only: [:index, :create]

  # Santé
  get "up" => "rails/health#show", as: :rails_health_check

  # API
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

      post 'register', to: 'auth#register'
      post 'login', to: 'auth#login'
      get 'me', to: 'auth#me'
      resources :favorites, only: [:index, :create, :destroy]
    end

    delete '/logout', to: 'api/v1/auth#logout'
  end
end
