class CreateItemComments < ActiveRecord::Migration[6.1]
  def change
    create_table :item_comments do |t|
      t.text :comment#コメント
      t.integer :customer_id#会員ID
      t.integer :item_id#商品ID

      t.timestamps
    end
  end
end
