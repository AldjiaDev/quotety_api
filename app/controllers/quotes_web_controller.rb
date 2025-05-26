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
end
