class PasswordResetsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      UserMailer.password_reset(@user).deliver_now
      redirect_to login_path, notice: "Un email de réinitialisation vous a été envoyé."
    else
      flash.now[:alert] = "Email non trouvé."
      render :new
    end
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to new_password_resets_path, alert: "Lien invalide ou expiré."
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to login_path, notice: "Votre mot de passe a été mis à jour."
    else
      render :edit
    end
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to new_password_resets_path, alert: "Lien invalide ou expiré."
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
