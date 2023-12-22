class ChangeCloumnsNotnullAddUsers < ActiveRecord::Migration[6.1]
  def change
    Item.where(favorites_count: nil).update_all(favorites_count: 0)
    change_column :items, :favorites_count, :integer, default: 0, null: false
  end
end

