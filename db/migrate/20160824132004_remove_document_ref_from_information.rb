class RemoveDocumentRefFromInformation < ActiveRecord::Migration[5.0]
  def change
    remove_reference :information, :document, foreign_key: true
  end
end
