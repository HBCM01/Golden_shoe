class Basket < ApplicationRecord
  has_many :basket_items, dependent: :destroy

  def add_shoe(shoe)
    current_item = basket_items.find_by(shoe_id: shoe.id)
    if current_item
      current_item.increment(:quantity)
    else
      current_item = basket_items.build(shoe_id: shoe.id)
    end
    current_item
  end

  def total_price
    basket_items.to_a.sum { |item| item.total_price }
  end
end
