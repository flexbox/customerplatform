class CreateSupplierProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :supplier_projects do |t|
      t.references :supplier, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
