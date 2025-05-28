class AuthorsWebController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
    @quotes = @author.quotes
  end
end
