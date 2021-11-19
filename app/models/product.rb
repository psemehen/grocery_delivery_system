class Product < ApplicationRecord
  include Filterable

  has_many :orders, dependent: :restrict_with_error
  belongs_to :category
  belongs_to :supplier

  validates :name, :price, presence: true
  validates :sku, uniqueness: true

  scope :by_category, ->(category_id) { where(category_id: category_id) }
  scope :by_name_sku, ->(name_or_sku) { where('LOWER(name) LIKE ? OR LOWER(sku) LIKE ?', "%#{name_or_sku}%", "%#{name_or_sku}%") }

  # selling only in USD
  def price_in_usd
    "$#{price}"
  end
end
