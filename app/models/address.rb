class Address < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 belongs_to :customer
 
  def zip_code_and_address_and_name
    "〒#{self.zip_code}  #{self.address}  #{self.name}"
  end
end
