class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string :title
      t.string :description
      t.string :file
      t.references :unit, foreign_key: true

      t.timestamps
    end
  end
end
