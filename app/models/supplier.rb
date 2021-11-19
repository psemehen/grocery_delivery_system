class Supplier < ApplicationRecord
  has_many :products, dependent: :destroy
  belongs_to :grocery

  validates :name, presence: true
end
