class User < ApplicationRecord
  has_secure_password

  has_many :orders, dependent: :restrict_with_error

  validates :first_name, :last_name, :email, :address, presence: true
  # TODO: add extra validations for email/password
  validates :email, uniqueness: { case_sensitive: false }

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
