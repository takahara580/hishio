class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  enum status: { 入金待ち: 0, 入金確認: 1, 発送準備中:2, 発送準備完了:3, 発送済み:4 }
  enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
  # 入金待ち="0"、入金確認="1"、製作中="2"、発送準備中="3"、発送済み="4"
  
  def subtotal
    non_taxed_price * amount
  end
  
  validates :zip_code, presence: true
  validates :address, presence: true
  validates :name, presence: true

end