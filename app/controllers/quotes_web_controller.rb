class QuotesWebController < ApplicationController
  def index
    @categories = Category.where(slug: %w[motivation vie humour sagesse litterature amour])
  end

  def category
    slug = params[:category]
    @category = Category.find_by(slug: slug)

    if @category
      @quotes = @category.quotes.includes(:author)
    else
      flash[:alert] = "Catégorie introuvable"
      redirect_to root_path
    end
  end

  def about
  end

  def search
    query = params[:q].downcase

    @quotes = Quote.joins(:author)
                 .where("LOWER(quotes.content) LIKE :q OR LOWER(authors.name) LIKE :q", q: "%#{query}%")
                 .includes(:author, :category)

    render :search_results
  end
end
