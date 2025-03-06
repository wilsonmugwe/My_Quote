class User < ApplicationRecord
  # Use has_secure_password for authentication
  has_secure_password

  # Relationships
  has_many :quotes, dependent: :destroy

  # Validations
  validates :fname, presence: true
  validates :lname, presence: true
  validates :email, presence: true, uniqueness: true
  #validates :status, presence: true, inclusion: { in: %w[Active Suspended Banned 0], message: "%{value} is not a valid status" }

  # Method to check if the user is a standard user
  def standard?
    !is_admin?
  end

  # Method to check if the user is an admin
  def admin?
    is_admin?
  end

  # Prevent login for suspended or banned users
  def active_for_authentication?
    super && (status == 'Active' || is_admin?)
  end

  # Convenience methods for checking status
  def active?
    status == 'Active'
  end

  def suspended?
    status == 'Suspended'
  end

  def banned?
    status == 'Banned'
  end
end
