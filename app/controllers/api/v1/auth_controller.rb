class Api::V1::AuthController < ApplicationController
   # POST /api/v1/register
   def register
    user = User.new(user_params)
      if user.save
      render json: { message: "Utilisateur créé avec succès", user: user }, status: :created
      else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

 # POST /api/v1/login
    def login
      user = User.find_by(email: params[:email])

      if user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)

    render json: {
      message: "Connexion réussie",
      token: token,
      user: {
        id: user.id,
        email: user.email,
        username: user.username
      }
    }, status: :ok
      else
    render json: { error: "Email ou mot de passe invalide" }, status: :unauthorized
    end
  end

  def me
    return unless authenticate_request

    render json: {
      id: current_user.id,
      email: current_user.email,
      username: current_user.username
    }
  end


  private

  def user_params
    params.permit(:email, :username, :password, :password_confirmation)
  end
end
