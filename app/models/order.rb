class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :sku, uniqueness: true
end
