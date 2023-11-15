class OrderDetail < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  belongs_to :order
  belongs_to :item
         
  enum item_status: {"入金待ち" => 1,"準備中" => 2,"出荷準備完了" =>3,}
end
