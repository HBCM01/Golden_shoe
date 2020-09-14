class Shoe < ApplicationRecord
  has_many :users, through: :orders
  has_many :orders
  has_many_attached :photos

  validates :name, presence: true, uniqueness: true
  validates :stock_level, presence: true
  validates :price, presence: true
  validates :material, presence: true
  validates :colour, presence: true
  validates :category, presence: true
  validates :department, presence: true
  validates :brand, presence: true
  validates :size, presence: true
end
