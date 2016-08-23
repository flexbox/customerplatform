class CreateDecisions < ActiveRecord::Migration[5.0]
  def change
    create_table :decisions do |t|
      t.references :unit, foreign_key: true
      t.references :supplier, foreign_key: true
      t.string :title
      t.references :document, foreign_key: true
      t.text :description
      t.date :date
      t.date :due_date

      t.timestamps
    end
  end
end
