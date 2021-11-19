class Category < ApplicationRecord
  has_many :products, dependent: :nullify
  belongs_to :grocery

  delegate :name, to: :grocery, prefix: true, allow_nil: true

  validates :name, uniqueness: { case_sensitive: false }, presence: true
end
