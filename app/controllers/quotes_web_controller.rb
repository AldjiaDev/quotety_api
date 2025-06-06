class QuotesWebController < ApplicationController
  def index
    @quotes = Quote.includes(:author, :category).limit(6)
    @categories = Category.all.map { |category| { name: category.name, slug: category.slug } }
  end


  def all
    @quotes = Quote.includes(:author, :category).all
  end

  def category
  @category = Category.find_by(slug: params[:category])
    if @category.nil?
    redirect_to quotes_path, alert: "Catégorie introuvable."
    else
    @quotes = @category.quotes.includes(:author)
    end
  end

  def print
    @quote = Quote.find(params[:id])
    render layout: "print"
  end

  def show
    @quote = Quote.find(params[:id])
  end

  def search
  query = "%#{params[:q]}%".downcase

  @quotes = Quote.joins(:author)
                 .where("LOWER(quotes.content) LIKE :q OR LOWER(authors.name) LIKE :q", q: query)
                 .includes(:author, :category)
  end
end
