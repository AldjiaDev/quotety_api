class FavoritesWebController < ApplicationController
  def index
    if current_user
      @favorites = current_user.favorite_quotes.includes(:author, :category)
    else
      redirect_to login_path, alert: "Veuillez vous connecter pour voir vos favoris."
    end
  end

  def destroy
    favorite = current_user.favorites.find_by(quote_id: params[:id])
    if favorite
      favorite.destroy
      redirect_to favorites_path, notice: "Citation retirée des favoris."
    else
      redirect_to favorites_path, alert: "Citation non trouvée dans vos favoris."
    end
  end

  def create
    quote = Quote.find(params[:quote_id])
    current_user.favorites.find_or_create_by(quote: quote)
    redirect_back fallback_location: root_path, notice: "Citation ajoutée aux favoris"
  end

    private

  def require_login
    unless current_user
      redirect_to login_path, alert: "Tu dois être connecté(e) pour ajouter aux favoris."
    end
  end
end
