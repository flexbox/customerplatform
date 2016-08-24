class AddDocumentIdToInformation < ActiveRecord::Migration[5.0]
  def change
    add_column :information, :document_id, :integer
  end
end
