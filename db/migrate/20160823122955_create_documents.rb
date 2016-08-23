class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.references :unit, foreign_key: true
      t.string :file
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
