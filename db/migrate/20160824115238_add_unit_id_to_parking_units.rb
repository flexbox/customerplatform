class AddUnitIdToParkingUnits < ActiveRecord::Migration[5.0]
  def change
    add_column :parking_units, :unit_id, :integer
  end
end
