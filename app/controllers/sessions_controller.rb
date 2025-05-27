class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to welcome_path, notice: "Bienvenue #{user.username} !"
      else
        flash.now[:alert] = "Email ou mot de passe invalide"
        render :new, status: :unprocessable_entity
      end
  end

  def welcome
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Vous êtes bien déconnecté·e."
  end
end
