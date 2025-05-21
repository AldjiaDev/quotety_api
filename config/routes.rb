Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :quotes, only: [:index, :show] do
        collection do
          get :search
        end
      end

      resources :authors, only: [:index, :show] do
        collection do
          get :search
        end
      end

      resources :categories, only: [:index, :show] do
        collection do
          get :search
        end
      end

      # 🔐 Authentification
      post 'register', to: 'auth#register'
      post 'login', to: 'auth#login'
      get 'me', to: 'auth#me'
      resources :favorites, only: [:index, :create, :destroy]
    end
  end
end
