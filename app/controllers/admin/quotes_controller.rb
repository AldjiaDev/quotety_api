class Admin::QuotesController < ApplicationController
  before_action :require_admin

  def index
    @quotes = Quote.includes(:author, :category).order(created_at: :desc)
  end

  def new
    @quote = Quote.new
  end

  def create
    author = Author.find_or_create_by(name: params[:author_name])
    @quote = Quote.new(quote_params)
    @quote.author = author

    if @quote.save
      redirect_to admin_quotes_path, notice: "Citation ajoutée avec succès."
    else
      flash.now[:alert] = "Erreur lors de l’ajout."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def require_admin
    unless current_user&.admin?
      redirect_to root_path, alert: "Accès réservé à l'administration"
    end
  end

  def quote_params
    params.require(:quote).permit(:content, :category_id)
  end
end
