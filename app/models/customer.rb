class Customer < ApplicationRecord
  has_many :cart_items
  has_many :orders
  has_many :addresses

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && self.is_active?
  end
end
