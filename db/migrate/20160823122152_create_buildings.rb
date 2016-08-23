class CreateBuildings < ActiveRecord::Migration[5.0]
  def change
    create_table :buildings do |t|
      t.references :lot, foreign_key: true
      t.string :building_name
      t.text :description
      t.string :picture
      t.string :address
      t.integer :floors
      t.integer :shared_space
      t.integer :elevator_amount

      t.timestamps
    end
  end
end
