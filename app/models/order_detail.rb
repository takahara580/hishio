class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum creating_status: {
      "入金待ち" => 0,
      "発送準備中" => 1,
      "発送準備完了" =>2,
  }
  
  def subtotal
    price * amount
  end
end