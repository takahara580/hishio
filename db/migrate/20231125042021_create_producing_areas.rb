class CreateProducingAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :producing_areas do |t|
      t.string :name, null: false#生産地名

      t.timestamps
    end
  end
end
