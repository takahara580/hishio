class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  
  
  validates :amount, presence: true
  validates :item_id, presence: true
  validates :customer_id, presence: true
  
  def subtotal
    item.non_taxed_price * amount
  end
end