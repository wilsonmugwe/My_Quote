class AdminController < ApplicationController
  before_action :authenticate_user!  # Ensure the user is signed in
  before_action :check_admin          # Ensure the user is an admin

  def dashboard
    # Fetch users based on their status for organized display
    @active_users = User.where(status: 'Active')
    @suspended_users = User.where(status: 'Suspended')
    @banned_users = User.where(status: 'Banned')

    # Render the admin dashboard view
    render 'admin/dashboard/index'
  end

  private

  def check_admin
    unless current_user.is_admin?
      redirect_to root_path, alert: "Access denied. Admins only."
    end
  end
end
