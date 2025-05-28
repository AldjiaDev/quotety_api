module Api
  module V1
    class FavoritesController < ApplicationController
      before_action :require_login

      def index
        favorites = current_user.favorite_quotes.includes(:author, :category)
        render json: favorites
      end

      def create
        quote = Quote.find(params[:quote_id])
        Favorite.create(user: current_user, quote: quote)
        render json: { success: true, message: "Ajouté aux favoris." }
      end

      def destroy
        favorite = current_user.favorites.find_by(quote_id: params[:id])
        if favorite
          favorite.destroy
          render json: { success: true, message: "Retiré des favoris." }
        else
          render json: { success: false, message: "Non trouvé." }, status: :not_found
        end
      end

      private

      def require_login
        unless current_user
          render json: { error: "Non autorisé" }, status: :unauthorized
        end
      end
    end
  end
end
