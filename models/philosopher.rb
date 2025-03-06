class Philosopher < ApplicationRecord
    # Relationships
    has_many :quotes, dependent: :destroy
  
    # Validations
    validates :fname, presence: true
    validates :lname, presence: true, allow_blank: true
  
    # Callbacks
    before_validation :set_default_lname, :set_default_birth_year, :set_default_death_year, :set_default_biography

    def full_name
      "#{fname} #{lname}"
    end
  
    private
  
    def set_default_lname
      self.lname ||= "(unknown)" if self.lname.blank? || self.lname.empty?
    end
  
    def set_default_birth_year
      self.birth_year ||= "Unknown" if self.birth_year.blank? || self.birth_year.to_s.empty?
    end
  
    def set_default_death_year
      self.death_year ||= "Unknown" if self.death_year.blank? || self.death_year.to_s.empty?
    end
  
    def set_default_biography
      self.biography ||= "Nil" if self.biography.blank? || self.biography.empty?
    end
end