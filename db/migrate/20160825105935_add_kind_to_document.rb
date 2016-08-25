class AddKindToDocument < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :kind, :string
  end
end
