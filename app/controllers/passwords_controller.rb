class PasswordsController < ApplicationController
  def new
  end

  def create
    flash[:notice] = "Si cette adresse existe, vous recevrez un lien de réinitialisation."
    redirect_to login_path
  end
end
