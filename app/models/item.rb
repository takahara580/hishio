class Item < ApplicationRecord
  has_one_attached :item_image
  belongs_to :genre
  belongs_to :producing_area
  has_many :favorites, dependent: :destroy
  def self.search_for(content)
    Item.where("name LIKE?","%#{content}%")
  end

  def get_item_image(width, height)
    unless self.item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      self.item_image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    end
    image_object = self.item_image
    image_object.variant(resize_to_limit: [width, height]).processed
  end



  def favorited_by?(customer)
    return false unless customer

    favorites.exists?(customer_id: customer.id)
  end
end