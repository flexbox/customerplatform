class AddUnitIdToStorageUnits < ActiveRecord::Migration[5.0]
  def change
    add_column :storage_units, :unit_id, :integer
  end
end
