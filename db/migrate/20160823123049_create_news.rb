class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.references :phase, foreign_key: true
      t.string :title
      t.text :description
      t.string :picture
      t.date :date

      t.timestamps
    end
  end
end
