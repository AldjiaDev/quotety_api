class Api::V1::QuotesController < ApplicationController
 # GET /api/v1/quotes
 def index
  quotes = Quote.includes(:author, :category)
                .page(params[:page])
                .per(params[:per_page] || 10)

  render json: {
    quotes: quotes.as_json(include: [:author, :category]),
    meta: {
      current_page: quotes.current_page,
      total_pages: quotes.total_pages,
      total_count: quotes.total_count
    }
  }
 end


# GET /api/v1/quotes/:id
  def show
  quote = Quote.find_by(id: params[:id])

    if quote
    render json: quote.as_json(
      only: [:id, :content],
      include: {
        author: { only: [:id, :name, :slug] },
        category: { only: [:id, :name, :slug] }
      }
    )
    else
    render json: { error: "Citation non trouvée" }, status: :not_found
    end
  end

# GET /api/v1/quotes/search?author=einstein
  def search
    if params[:author].present?
    quotes = Quote.joins(:author)
                  .where("authors.name ILIKE ?", "%#{params[:author]}%")
                  .includes(:author, :category)

    render json: quotes.as_json(
      only: [:id, :content],
      include: {
        author: { only: [:id, :name, :slug] },
        category: { only: [:id, :name, :slug] }
      }
    )
    else
    render json: { error: "Le paramètre 'author' est requis" }, status: :bad_request
    end
  end
end
