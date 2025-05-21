class Api::V1::FavoritesController < ApplicationController
  before_action :authenticate_request

  # GET /api/v1/favorites
  def index
    favorites = current_user.favorite_quotes.includes(:author, :category)
    render json: favorites.as_json(
      only: [:id, :content],
      include: {
        author: { only: [:id, :name, :slug] },
        category: { only: [:id, :name, :slug] }
      }
    )
  end

  # POST /api/v1/favorites
  def create
    quote = Quote.find_by(id: params[:quote_id])
    return render json: { error: "Citation introuvable" }, status: :not_found unless quote

    favorite = current_user.favorites.build(quote: quote)

    if favorite.save
      render json: { message: "Citation ajoutée aux favoris" }, status: :created
    else
      render json: { error: favorite.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/favorites/:id
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id])
    return render json: { error: "Favori introuvable" }, status: :not_found unless favorite

    favorite.destroy
    render json: { message: "Citation retirée des favoris" }
  end
end
