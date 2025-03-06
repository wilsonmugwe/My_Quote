class QuotesController < ApplicationController
  before_action :set_quote, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create edit update destroy my_quotes]
  before_action :authorize_user!, only: [:destroy]

  # GET /quotes or /quotes.json
  def index
    if user_signed_in?
      @quotes = Quote.where(is_public: true).or(current_user.quotes)
    else
      @quotes = Quote.where(is_public: true)
    end

    # Handle the case where no quotes are found
    if @quotes.present? && params[:category_id]
      flash.now[:alert] = "No quotes found for this category."
    end
  end

  # GET /quotes/1 or /quotes/1.json
  def show; end

  # GET /quotes/new
  def new
    @quote = Quote.new
    @philosophers = Philosopher.all
    @categories = Category.all
  end
  
  # GET /quotes/manage
  def manage
    @quotes = Quote.all 
  end


  # GET /quotes/1/edit
  def edit; end

  # POST /quotes or /quotes.json
  def create
    @quote = current_user.quotes.build(quote_params)

    if @quote.save
      redirect_to @quote, notice: "Quote was successfully created."
    else
      @philosophers = Philosopher.all  # Re-initialize to show options again
      @categories = Category.all  # Re-initialize to show options again
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /quotes/1 or /quotes/1.json
  def update
    if @quote.update(quote_params)
      redirect_to @quote, notice: "Quote was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /quotes/1 or /quotes/1.json
  def destroy
    @quote.destroy
    redirect_to quotes_path, status: :see_other, notice: "Quote was successfully destroyed."
  end

  # GET /quotes/manage
  def manage
    # Logic for managing quotes (e.g., filter, sort, etc.)
  end

  # GET /quotes/my_quotes
  def my_quotes
    @quotes = current_user.quotes
    render :index  # Reuses the index view to display current_user's quotes
  end

  private

  def set_quote
    @quote = Quote.find_by(id: params[:id])
    redirect_to quotes_path, alert: "Quote not found." unless @quote
  end

  def quote_params
    params.require(:quote).permit(:quote, :publication, :is_public, :comments, :philosopher_id, :category_id)
  end

  # Authorization check for destroy action
  def authorize_user!
    unless current_user == @quote.user || current_user.is_admin
      flash[:alert] = "You are not authorized to delete this quote."
      redirect_to quotes_path
    end
  end
end
