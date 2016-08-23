class CreateLots < ActiveRecord::Migration[5.0]
  def change
    create_table :lots do |t|
      t.references :phase, foreign_key: true
      t.string :lot_number
      t.text :description
      t.string :picture
      t.string :cadastral_reference
      t.integer :lot_size

      t.timestamps
    end
  end
end
