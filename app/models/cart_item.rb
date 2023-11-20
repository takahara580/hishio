class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  
  def subtotal
    item.non_taxed_price * amount
  end
end