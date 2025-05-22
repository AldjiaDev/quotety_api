class ApplicationController < ActionController::Base
  private

  def authenticate_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header

    begin
      decoded = JsonWebToken.decode(token)
      @current_user = User.find(decoded[:user_id])
      true
    rescue
      render json: { error: 'Token invalide ou expiré' }, status: :unauthorized
      false
    end
  end

  def current_user
    @current_user
  end
end
