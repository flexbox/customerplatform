class CreateUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :units do |t|
      t.references :building, foreign_key: true
      t.references :customer, foreign_key: true
      t.string :unit_name
      t.text :description
      t.string :picture
      t.string :address
      t.integer :floor_number
      t.string :orientation
      t.integer :floor_size
      t.boolean :sold
      t.integer :price_initial_budget
      t.integer :price_contracted
      t.integer :land_value
      t.integer :construction_value
      t.integer :registration_tax_land
      t.integer :vat_construction
      t.string :sales_person
      t.integer :consulting_hours

      t.timestamps
    end
  end
end
