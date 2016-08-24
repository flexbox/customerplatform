class AddDocumentIdToDecisions < ActiveRecord::Migration[5.0]
  def change
    add_column :decisions, :document_id, :integer
  end
end
