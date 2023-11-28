class AddFavoritesCountToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :favorites_count, :integer
  end
end
