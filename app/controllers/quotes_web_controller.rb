class QuotesWebController < ApplicationController
  def index
    @quotes = Quote.all
  end

def category
  @category = Category.find_by(name: params[:category])
  if @category
    @quotes = @category.quotes.includes(:author)
  else
    render plain: "Catégorie introuvable : #{params[:category]}", status: :not_found
  end
end

  def search
    query = params[:q]
    @quotes = Quote.where("content ILIKE ?", "%#{query}%")
  end
end
