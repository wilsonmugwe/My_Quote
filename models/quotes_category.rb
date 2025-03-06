class QuotesCategory < ApplicationRecord
  # Relationships
  belongs_to :quote
  belongs_to :category

  # Validations
  validates :quote_id, presence: true
  validates :category_id, presence: true


  def search
    if params[:quote_query].present?
      @quotes = Quote.where("content ILIKE ?", "%#{params[:quote_query]}%") # Adjust the attribute as necessary
    else
      @quotes = Quote.all # Default to all quotes if no search query
    end
    render :index # Or render a different view as needed
  end
end