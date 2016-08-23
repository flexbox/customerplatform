class CreateInformation < ActiveRecord::Migration[5.0]
  def change
    create_table :information do |t|
      t.references :unit, foreign_key: true
      t.string :title
      t.references :document, foreign_key: true
      t.text :description
      t.boolean :read
      t.date :date

      t.timestamps
    end
  end
end
