class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def index
    @active_users = User.where(status: 'Active')
    @suspended_users = User.where(status: 'Suspended')
    @banned_users = User.where(status: 'Banned')
  end

  private

  def require_admin
    redirect_to root_path, alert: "Access denied." unless current_user&.is_admin
  end
end
