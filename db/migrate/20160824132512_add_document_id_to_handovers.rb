class AddDocumentIdToHandovers < ActiveRecord::Migration[5.0]
  def change
    add_column :handovers, :document_id, :integer
  end
end
