class AuthorsWebController < ApplicationController
  def index
    @authors = Author.order(:name).page(params[:page]).per(6)
  end

  def show
    @author = Author.find(params[:id])
    @quotes = @author.quotes
  end
end
