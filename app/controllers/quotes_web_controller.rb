class QuotesWebController < ApplicationController
  def index
    @categories = Category.where(slug: %w[motivation vie humour sagesse litterature amour])
  end
end
