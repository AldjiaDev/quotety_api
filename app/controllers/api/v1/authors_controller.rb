class Api::V1::AuthorsController < ApplicationController
  # GET /api/v1/authors
  def index
    authors = Author.all
    render json: authors.as_json(only: [:id, :name, :slug])
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
