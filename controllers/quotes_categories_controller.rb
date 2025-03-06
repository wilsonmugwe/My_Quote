class QuotesCategoriesController < ApplicationController
  before_action :set_quotes_category, only: %i[ show edit update destroy ]

  # GET /quotes_categories or /quotes_categories.json
  def index
    @quotes_categories = QuotesCategory.all
  end

  # GET /quotes_categories/1 or /quotes_categories/1.json
  def show
  end

  # GET /quotes_categories/new
  def new
    @quotes_category = QuotesCategory.new
  end

  # GET /quotes_categories/1/edit
  def edit
  end

  # POST /quotes_categories or /quotes_categories.json
  def create
    @quotes_category = QuotesCategory.new(quotes_category_params)

    respond_to do |format|
      if @quotes_category.save
        format.html { redirect_to @quotes_category, notice: "Quotes category was successfully created." }
        format.json { render :show, status: :created, location: @quotes_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quotes_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes_categories/1 or /quotes_categories/1.json
  def update
    respond_to do |format|
      if @quotes_category.update(quotes_category_params)
        format.html { redirect_to @quotes_category, notice: "Quotes category was successfully updated." }
        format.json { render :show, status: :ok, location: @quotes_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quotes_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes_categories/1 or /quotes_categories/1.json
  def destroy
    @quotes_category.destroy

    respond_to do |format|
      format.html { redirect_to quotes_categories_path, status: :see_other, notice: "Quotes category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quotes_category
      @quotes_category = QuotesCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quotes_category_params
      params.require(:quotes_category).permit(:quote_id, :category_id)
    end
end
