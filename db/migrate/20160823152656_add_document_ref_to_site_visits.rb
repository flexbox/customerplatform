class AddDocumentRefToSiteVisits < ActiveRecord::Migration[5.0]
  def change
    add_reference :site_visits, :document, foreign_key: true
  end
end
