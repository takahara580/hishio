class AddProducingAreaIdToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :producing_area_id, :integer#生産地ID
  end
end
