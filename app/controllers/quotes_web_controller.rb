class QuotesWebController < ApplicationController
  def index
    @quotes = Quote.all
  end

def category
  @category = Category.find_by(slug: params[:category])
  if @category
    @quotes = @category.quotes.includes(:author, :category)
  else
    redirect_to quotes_path, alert: "Catégorie introuvable"
  end
end
  def search
    @quotes = Quote.where("content LIKE ?", "%#{params[:q]}%").includes(:author, :category)
  end
end
