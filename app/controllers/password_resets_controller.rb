class PasswordResetsController < ApplicationController
  def new
  end

  def create
    # À compléter plus tard avec la logique de reset
    flash[:notice] = "Si votre adresse email existe, vous recevrez un lien pour réinitialiser votre mot de passe."
    redirect_to login_path
  end
end
