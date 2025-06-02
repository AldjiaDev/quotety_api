class QuotesWebController < ApplicationController
  def index
    @categories = Category.all.map do |category|
    {
      name: category.name,
      slug: category.slug,
    }
    end
  end

  def category
  @category = Category.find_by(slug: params[:category])
  if @category.nil?
    redirect_to quotes_path, alert: "Catégorie introuvable."
  else
    @quotes = @category.quotes.includes(:author)
  end
end


  def search
    @quotes = Quote.where("content LIKE ?", "%#{params[:q]}%").includes(:author, :category)
  end
end
