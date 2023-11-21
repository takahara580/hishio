class Item < ApplicationRecord
  has_one_attached :item_image
  belongs_to :genre

  def get_item_image(width, height)
    unless self.item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      self.item_image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    end
    image_object = self.item_image
    image_object.variant(resize_to_limit: [width, height]).processed
  end
end