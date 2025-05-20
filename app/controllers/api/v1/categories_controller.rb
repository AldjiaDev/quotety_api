class Api::V1::CategoriesController < ApplicationController
   # GET /api/v1/categories
   def index
    categories = Category.all
    render json: categories.as_json(only: [:id, :name, :slug])
  end

  # GET /api/v1/categories/:id
  def show
    category = Category.find_by(id: params[:id])

    if category
      render json: category.as_json(
        only: [:id, :name, :slug],
        include: {
          quotes: {
            only: [:id, :content],
            include: {
              author: { only: [:id, :name, :slug] }
            }
          }
        }
      )
    else
      render json: { error: "Catégorie non trouvée" }, status: :not_found
    end
  end
  # GET /api/v1/categories/:id/quotes
  def search
    if params[:name].present?
      categories = Category.where("name ILIKE ?", "%#{params[:name]}%")
      render json: categories.as_json(only: [:id, :name, :slug])
    else
      render json: { error: "Le paramètre 'name' est requis" }, status: :bad_request
    end
  end
end
