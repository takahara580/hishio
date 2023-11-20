class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :genre
 
  def get_item_image(width, height)
    unless self.image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      self.image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    end
    self.image.variant(resize_to_limit: [width, height]).processed
  end

end