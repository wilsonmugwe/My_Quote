class PasswordResetsController < ApplicationController
  before_action :find_user_by_email, only: [:create]
  before_action :find_user_by_token, only: [:edit, :update]

  # Render the form to request a password change
  def new
    @user = User.new 
    # This will render a simple page to enter the email
  end

  # Find the user by email and generate reset token
  def create
    if @user
      @user.generate_reset_password_token  # Generates the reset token and sets timestamp
      redirect_to edit_password_reset_path(@user.reset_password_token)
    else
      flash.now[:error] = "Email not found."
      render :new
    end
  end

  # Show the form for changing the password
  def edit
    if @user.nil? || !@user.reset_password_sent_at || @user.reset_password_sent_at < 2.hours.ago
      flash[:error] = "Password reset link is invalid or has expired."
      redirect_to new_password_reset_path
    end
    render :edit
    # No need for an explicit render if you redirect or the view name matches
  end

  # Update the password directly
  def update
    if @user.update(password_params)
      # Clear any existing password reset token and timestamps
      @user.update(reset_password_token: nil, reset_password_sent_at: nil)
      redirect_to root_path, notice: "Password has been changed successfully."
    else
      flash.now[:error] = "Error changing password. Please try again."
      render :edit  # Render the edit form again if update fails
    end
  end

  private

  # Find the user by email to set up for password change
  def find_user_by_email
    @user = User.find_by(email: params[:email])
    Rails.logger.debug "User found by email: #{@user.inspect}"  # Debugging output
  end

  # Find the user by reset password token for editing
  def find_user_by_token
    @user = User.find_by(reset_password_token: params[:id]) # Assumes your routes are set up to pass the token
    Rails.logger.debug "User found by token: #{@user.inspect}"  # Debugging output
    if @user.nil?
      flash[:error] = "Invalid password reset token."
      redirect_to new_password_reset_path
    end
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
