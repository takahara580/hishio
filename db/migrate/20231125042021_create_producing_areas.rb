class CreateProducingAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :producing_areas do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
