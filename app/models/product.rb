class Product < ApplicationRecord
  has_many :orders, dependent: :restrict_with_error
  belongs_to :category
  belongs_to :supplier

  validates :name, presence: true
  validates :sku, uniqueness: true

  # selling only in USD
  def price_in_usd
    "$#{price}"
  end
end
