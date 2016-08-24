class RemoveDocumentRefFromHandovers < ActiveRecord::Migration[5.0]
  def change
    remove_reference :handovers, :document, foreign_key: true
  end
end
