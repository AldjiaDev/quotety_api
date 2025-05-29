module Admin
  class DashboardController < ApplicationController
    before_action :require_admin

    def index
      # Interface de gestion centrale
    end

    private

    def require_admin
      unless current_user&.admin?
        redirect_to root_path, alert: "Accès réservé à l'administration"
      end
    end
  end
end
