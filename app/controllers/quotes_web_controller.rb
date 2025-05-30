class QuotesWebController < ApplicationController
  def index
    @quotes = Quote.all
  end

  def category
    @category = Category.find_by(name: params[:category])
    if @category
      @quotes = @category.quotes
      render :category
    else
      redirect_to root_path, alert: "Catégorie introuvable."
    end
  end

  def search
    query = params[:q]
    @quotes = Quote.where("content ILIKE ?", "%#{query}%")
  end
end

