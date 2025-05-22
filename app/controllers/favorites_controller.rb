class FavoritesController < ApplicationController
  def create
    quote = Quote.find(params[:quote_id])

    # ⚠️ En attendant une vraie session utilisateur
    user = User.first # temporaire pour test
    Favorite.create(user: user, quote: quote)

    redirect_to root_path, notice: "Ajouté aux favoris"
  end
end
