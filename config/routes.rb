Rails.application.routes.draw do
  # Route de vérification de santé de l'app
  get "up" => "rails/health#show", as: :rails_health_check

  # Routes de l'API
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
        collection  do
          get :search
        end
      end
    end
  end
end
