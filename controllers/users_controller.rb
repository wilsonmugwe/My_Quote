class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy update_status toggle_admin]
  before_action :require_admin, only: %i[index update_status destroy toggle_admin]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    # You can add logic here if needed
  end

  # PATCH /users/1/update_status
  def update_status
    valid_statuses = %w[active suspended banned]
    
    if valid_statuses.include?(params[:status])
      if @user.update(status: params[:status])
        redirect_to users_path, notice: "User status updated to #{params[:status].capitalize}."
      else
        redirect_to users_path, alert: "Unable to update user status. Please try again."
      end
    else
      redirect_to users_path, alert: "Invalid status provided."
    end
  end

  def toggle_admin
    if @user.update(is_admin: !@user.is_admin)
      status = @user.is_admin ? "Admin" : "Standard User"
      redirect_to users_path, notice: "User role changed to #{status}."
    else
      redirect_to users_path, alert: "Unable to change user role."
    end
  end
  

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params.except(:is_admin)) # Exclude sensitive attributes
    @user.status = 'active' # Set status to active when user is created

    if @user.save
      session[:user_id] = @user.id # Sign in the user immediately
      flash[:notice] = 'Account created successfully! You can add your quotes now.'
      redirect_to user_quotes_path(@user) # Redirect to the user's quotes page
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user.update(user_params.except(:is_admin, :status)) # Exclude sensitive attributes
      redirect_to @user, notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    if @user.destroy
      redirect_to users_path, notice: "User was successfully destroyed."
    else
      redirect_to users_path, alert: "Unable to delete user."
    end
  end
  
  def profile
    @user = current_user
    @quotes = @user.quotes
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
    redirect_to users_path, alert: "User not found." unless @user
  end

  def require_admin
    redirect_to root_path, alert: "Access denied." unless current_user&.is_admin # Prevent errors if current_user is nil
  end

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :password) # Exclude status and is_admin
  end
end
