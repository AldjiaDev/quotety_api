class UsersController < ApplicationController
  before_action :require_login

  def show
    @user = current_user
  end

  private

  def require_login
    unless current_user
      redirect_to new_session_path, alert: "Vous devez être connecté pour accéder à cette page."
    end
  end
end
