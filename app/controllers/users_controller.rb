class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: "Compte créé avec succès."
    else
      render :new
    end
  end

  def show
    if current_user
      @user = current_user
    else
      redirect_to login_path, alert: "Vous devez être connecté pour accéder à votre profil."
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
