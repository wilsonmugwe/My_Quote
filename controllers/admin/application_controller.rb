class Admin::ApplicationController < ApplicationController
    before_action :authenticate_admin!
  
    private
  
    def authenticate_admin!
      unless current_user&.is_admin
        redirect_to root_path, alert: "Access denied: Admins only."
      end
    end
end
  