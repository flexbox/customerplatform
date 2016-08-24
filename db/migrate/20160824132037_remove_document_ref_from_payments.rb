class RemoveDocumentRefFromPayments < ActiveRecord::Migration[5.0]
  def change
    remove_reference :payments, :document, foreign_key: true
  end
end
