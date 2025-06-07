class UserMailer < ApplicationMailer
  def password_reset(user)
    @user = user
    @token = user.signed_id(purpose: "password_reset", expires_in: 15.minutes)

    mail(to: @user.email, subject: "Réinitialisation de votre mot de passe")
  end
end
