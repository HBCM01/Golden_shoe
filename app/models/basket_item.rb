class BasketItem < ApplicationRecord
  belongs_to :shoe
  belongs_to :basket
end
