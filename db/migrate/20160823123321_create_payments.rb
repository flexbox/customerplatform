class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.references :unit, foreign_key: true
      t.string :name
      t.references :document, foreign_key: true
      t.text :description
      t.integer :amount
      t.string :status

      t.timestamps
    end
  end
end
