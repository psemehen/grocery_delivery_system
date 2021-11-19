class Category < ApplicationRecord
  has_many :products, dependent: :nullify
  belongs_to :grocery

  validates :name, uniqueness: { case_sensitive: false }, presence: true
end
