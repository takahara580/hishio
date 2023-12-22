class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false#ジャンルID
      t.string :name, null: false#商品名
      t.text :text, null: false#説明
      t.boolean :is_active, null: false, default: true#販売ステータス
      t.integer :non_taxed_price, null: false#税抜き価格
      t.timestamps
    end
  end
end
