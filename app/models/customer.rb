class Customer < ApplicationRecord
  has_many :cart_items
  has_many :orders
  has_many :addresses
  has_many :favorites, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  def self.search_for(content)
    Customer.where("last_name LIKE ? or first_name LIKE ? or last_name_kana LIKE ? or first_name_kana LIKE ?", "%#{content}%", "%#{content}%", "%#{content}%", "%#{content}%")
  end

  def active_for_authentication?
    super && self.is_active?
  end
end
