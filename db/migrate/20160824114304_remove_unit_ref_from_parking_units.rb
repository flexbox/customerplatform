class RemoveUnitRefFromParkingUnits < ActiveRecord::Migration[5.0]
  def change
    remove_reference :parking_units, :unit, foreign_key: true
  end
end
