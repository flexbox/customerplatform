class AddDocumentIdToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :document_id, :integer
  end
end
