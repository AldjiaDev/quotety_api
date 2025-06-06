class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  helper MetaHelper


  private

  def current_user
    @current_user ||= begin
      if session[:user_id]
        User.find_by(id: session[:user_id])
      elsif request.headers['Authorization'].present?
        token = request.headers['Authorization'].split(' ').last
        decoded = JsonWebToken.decode(token)
        User.find_by(id: decoded[:user_id])
      end
    rescue
      nil
    end
  end
end
