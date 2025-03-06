class HomeController < ApplicationController
  def index
    @categories = Category.all
    @quotes = Quote.includes(:philosopher).order(created_at: :desc)
  end

  def my_quotes
    unless session[:user_id]
      redirect_to sign_in_path, alert: "You must be logged in to view your quotes."
      return
    end
  
    @quotes = Quote.where(user_id: session[:user_id]) # Fetch quotes associated with the current user
  
    # Add this line to debug if @quotes is being set correctly
    Rails.logger.debug "Quotes for User ID #{session[:user_id]}: #{@quotes.inspect}"
  
    render 'user_home' # This line will render user_home.html.erb
  end
  
end
