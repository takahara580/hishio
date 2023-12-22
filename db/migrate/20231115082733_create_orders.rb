class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false#会員ID
      t.string :name, null: false#配送先宛名
      t.string :address, null: false#配送先住所
      t.string :zip_code, null: false#配送先郵便番号
      t.integer :postage, null: false#送料
      t.integer :billing_amount, null: false#請求額
      t.integer :payment_method, null: false#支払方法
      t.integer :status, null: false, default: 0#注文ステータス
      t.timestamps
    end
  end
end
