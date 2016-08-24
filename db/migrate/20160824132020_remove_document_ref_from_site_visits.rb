class RemoveDocumentRefFromSiteVisits < ActiveRecord::Migration[5.0]
  def change
    remove_reference :site_visits, :document, foreign_key: true
  end
end
