class CreatePhases < ActiveRecord::Migration[5.0]
  def change
    create_table :phases do |t|
      t.references :project, foreign_key: true
      t.integer :phase_number
      t.text :description
      t.integer :duration
      t.string :picture

      t.timestamps
    end
  end
end
