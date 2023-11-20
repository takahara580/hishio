class Address < ApplicationRecord
 belongs_to :customer
 
  validates :zip_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  
  def zip_code_and_address_and_name
    "〒#{self.zip_code}  #{self.address}  #{self.name}"
  end
end