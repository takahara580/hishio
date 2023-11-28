class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  def favorites_count
    favorites.count
  end
end
