class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      t.integer :order_id, null: false#注文ID
      t.integer :item_id, null: false#商品ID
      t.integer :price, null: false#購入時価格
      t.integer :amount, null: false#数量
      t.integer :creating_status, null: false, default: 0#販売ステータス
      t.timestamps
    end

  end
end
