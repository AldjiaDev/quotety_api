class PasswordsController < ApplicationController
  def new
    # affiche le formulaire
  end

  def create
    # Ici tu peux simuler une action, on mettra le vrai envoi d'email plus tard
    flash[:notice] = "Si cette adresse existe, vous recevrez un lien de réinitialisation."
    redirect_to login_path
  end
end
