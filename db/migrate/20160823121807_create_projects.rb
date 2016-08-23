class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :commercial_name
      t.string :internal_name
      t.text :description
      t.string :coordinates
      t.integer :plotsize

      t.timestamps
    end
  end
end
