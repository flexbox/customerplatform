class CreateHandovers < ActiveRecord::Migration[5.0]
  def change
    create_table :handovers do |t|
      t.references :unit, foreign_key: true
      t.references :document, foreign_key: true
      t.string :title
      t.text :description
      t.date :date

      t.timestamps
    end
  end
end
