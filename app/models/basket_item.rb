class BasketItem < ApplicationRecord
  belongs_to :shoe
  belongs_to :basket

  def total_price
    shoe.price * quantity.to_i
  end
end
