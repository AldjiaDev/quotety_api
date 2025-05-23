class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :set_current_user_from_token

  private

  # Décode le token JWT pour récupérer l'utilisateur
  def set_current_user_from_token
    header = request.headers['Authorization']
    token = header&.split(' ')&.last

    if token
      begin
        decoded = JsonWebToken.decode(token)
        @current_user = User.find_by(id: decoded[:user_id])
      rescue JWT::DecodeError, ActiveRecord::RecordNotFound
        @current_user = nil
      end
    end
  end

  def current_user
    @current_user
  end

  helper_method :current_user
end
