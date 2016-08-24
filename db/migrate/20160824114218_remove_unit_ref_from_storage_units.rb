class RemoveUnitRefFromStorageUnits < ActiveRecord::Migration[5.0]
  def change
    remove_reference :storage_units, :unit, foreign_key: true
  end
end
