class Quote < ApplicationRecord
    belongs_to :category
    belongs_to :user
    belongs_to :philosopher

    has_many :quotes_categories
    has_many :categories, through: :quotes_categories
end