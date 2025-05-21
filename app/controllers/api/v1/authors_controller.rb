class Api::V1::AuthorsController < ApplicationController
  # GET /api/v1/authors
  def index
    authors = Author.page(params[:page]).per(params[:per_page] || 10)

    render json: {
      authors: authors,
      meta: {
        current_page: authors.current_page,
        total_pages: authors.total_pages,
        total_count: authors.total_count
      }
    }
  end


  # GET /api/v1/authors/:id
  def show
    author = Author.find_by(id: params[:id])

    if author
      render json: author.as_json(
        only: [:id, :name, :slug, :bio],
        include: {
          quotes: {
            only: [:id, :content],
            include: {
              category: { only: [:id, :name, :slug] }
            }
          }
        }
      )
    else
      render json: { error: "Auteur non trouvé" }, status: :not_found
    end
  end
  def search
    if params[:name].present?
      authors = Author.where("name ILIKE ?", "%#{params[:name]}%")
      render json: authors.as_json(only: [:id, :name, :slug])
    else
      render json: { error: "Le paramètre 'name' est requis" }, status: :bad_request
    end
  end
end
