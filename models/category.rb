class Category < ApplicationRecord
    # Relationships
    has_many :quotes_categories, dependent: :destroy
    has_many :quotes, through: :quotes_categories
  
    # Validations
    validates :category_name, presence: true
end
