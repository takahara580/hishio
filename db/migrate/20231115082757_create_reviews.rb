class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :customer_id, null: false
      t.integer :item_id, null: false
      t.string :comment, null: false
      t.string :st, null: false

      t.timestamps
    end
  end
end
