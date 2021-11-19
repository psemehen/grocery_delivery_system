class Grocery < ApplicationRecord
  has_many :suppliers, dependent: :nullify
  has_many :categories, dependent: :nullify

  validates :name, uniqueness: { case_sensitive: false }, presence: true
end
