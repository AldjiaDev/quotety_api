Rails.application.routes.draw do
  root "quotes_web#index"

  # Vue HTML
  get "categories", to: "quotes_web#index"
  get 'categories/:category', to: 'quotes_web#category', as: :category_quotes
  get '/about', to: 'quotes_web#about', as: :about # <-- Déplacée ici
  resources :favorites, only: [:index, :create]

  # 🔐 Authentification côté Vue HTML
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete "/logout", to: "sessions#destroy"

  get '/register', to: 'registrations#new'
  post '/register', to: 'registrations#create'
  get '/welcome', to: 'sessions#welcome', as: :welcome
  get "/me", to: "users#show", as: :me




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
