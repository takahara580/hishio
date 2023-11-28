class Customer < ApplicationRecord
  has_many :cart_items
  has_many :orders
  has_many :addresses
  has_many :favorites, dependent: :destroy
  has_many :item_comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :zip_code, presence: true, length: { is: 7 }
  validates :address, presence: true, length: { maximum: 50 }
  validates :phone_number, presence: true, length: { in: 10..11 }
  validates :is_active, inclusion: { in: [true, false] }
         
  def self.search_for(content)
    Customer.where("last_name LIKE ? or first_name LIKE ? or last_name_kana LIKE ? or first_name_kana LIKE ?", "%#{content}%", "%#{content}%", "%#{content}%", "%#{content}%")
  end

  def active_for_authentication?
    super && self.is_active?
  end
  
  def admin?
    # 顧客が管理者であるかを判定するロジック
    self.role == 'admin'
  end
end
