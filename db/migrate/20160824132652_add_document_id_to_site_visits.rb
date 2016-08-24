class AddDocumentIdToSiteVisits < ActiveRecord::Migration[5.0]
  def change
    add_column :site_visits, :document_id, :integer
  end
end
