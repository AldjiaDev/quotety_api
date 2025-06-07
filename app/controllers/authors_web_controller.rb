class AuthorsWebController < ApplicationController
  def index
    @authors = Author.order(:name).page(params[:page]).per(15)
  end

  def show
    @author = Author.find(params[:id])
    @quotes = @author.quotes
  end
end
