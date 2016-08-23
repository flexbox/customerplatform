class CreateStorageUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :storage_units do |t|
      t.references :building, foreign_key: true
      t.references :unit, foreign_key: true
      t.string :storage_name
      t.integer :storage_size

      t.timestamps
    end
  end
end
