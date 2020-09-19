class Shoe < ApplicationRecord
  before_destroy :not_referenced_by_any_basket_item
  # has_many :users, through: :orders
  belongs_to :user, optional: true
  has_many_attached :photos
  has_many :basket_items

  validates :name, presence: true, uniqueness: true
  validates :stock_level, presence: true
  validates :price, presence: true
  validates :material, presence: true
  validates :colour, presence: true
  validates :category, presence: true
  validates :department, presence: true
  validates :brand, presence: true
  validates :size, presence: true
  include PgSearch::Model
  pg_search_scope :shoe_search,
    against: [:name, :brand, :description, :department, :colour],
     using: {
      tsearch: { prefix: true }
            }

  private

  def not_referenced_by_any_basket_item
    unless basket_items.empty?
      errors.add(:base, "Basket items present")
      throw :abort
    end
  end
end
