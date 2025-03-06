class ApplicationController < ActionController::Base
  helper_method :current_user, :user_signed_in?, :is_admin?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    !current_user.nil?
  end

  def is_admin?
    current_user&.is_admin?  # Checks the `is_admin` attribute on the current user
  end

  private

  def authenticate_user!
    redirect_to sign_in_path, alert: "You must be logged in to access this section." unless user_signed_in?
  end
end
