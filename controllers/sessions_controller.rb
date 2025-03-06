class SessionsController < ApplicationController
  def new
    @user = User.new # Initialize a new user object for the form
  end

  def create
    # Find the user by email
    user = User.find_by(email: params[:email])

    # Validate user and password
    if user && user.authenticate(params[:password])
      # Check if the user is active
      unless user.suspended? || user.banned?
        # Sign in the user manually
        session[:user_id] = user.id # Set user ID in session
        flash[:notice] = "You are signed in successfully!" # Set the sign-in message

        # Redirect based on user role
        if user.admin?
          redirect_to admin_dashboard_path
        else
          redirect_to my_quotes_path # Redirect to the user's quotes
        end
      else
        # Handle suspended or banned users
        flash.now[:error] = "Your account is currently #{user.status.downcase}. Please contact support." # Show appropriate error
        render 'new' # Render the sign-in form again
      end
    else
      flash.now[:error] = "Invalid email or password." # Show error on the same page
      render 'new' # Render the sign-in form again
    end
  end

  def destroy
    # Sign out the user by clearing the session
    session[:user_id] = nil
    flash[:notice] = "You have successfully signed out. See you next time!" # Set sign-out message
    redirect_to root_path # Redirect to the home page
  end
end
