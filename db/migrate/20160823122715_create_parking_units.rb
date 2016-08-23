class CreateParkingUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :parking_units do |t|
      t.references :lot, foreign_key: true
      t.references :unit, foreign_key: true
      t.string :parking_name

      t.timestamps
    end
  end
end
