class UsersController < ApplicationController
  before_action :require_login

  def new
    @user = User.new
  end
  def show
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to me_path, notice: "Bienvenue #{@user.username} !"
    else
      flash.now[:alert] = "Erreur lors de l'inscription"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def require_login
    unless current_user
      redirect_to new_session_path, alert: "Vous devez être connecté pour accéder à cette page."
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
