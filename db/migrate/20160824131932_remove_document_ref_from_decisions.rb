class RemoveDocumentRefFromDecisions < ActiveRecord::Migration[5.0]
  def change
    remove_reference :decisions, :document, foreign_key: true
  end
end
