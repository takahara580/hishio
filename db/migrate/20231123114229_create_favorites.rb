class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :customer, null: false, foreign_key: true#会員ID
      t.references :item, null: false, foreign_key: true#商品ID
      t.timestamps
    end
  end
end
