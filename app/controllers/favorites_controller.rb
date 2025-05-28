module Api
  module V1
    class FavoritesController < ApplicationController
      before_action :require_login

      def index
        @favorites = current_user.favorite_quotes.includes(:author, :category)
        render json: @favorites
      end

      def create
        quote = Quote.find(params[:quote_id])
        favorite = current_user.favorites.find_or_create_by(quote: quote)
        render json: { success: true, favorite_id: favorite.id }
      end

      def destroy
        favorite = current_user.favorites.find_by(quote_id: params[:id])
        if favorite
          favorite.destroy
          render json: { success: true }
        else
          render json: { error: "Not found" }, status: :not_found
        end
      end

      private

      def require_login
        unless current_user
          render json: { error: "Unauthorized" }, status: :unauthorized
        end
      end
    end
  end
end
