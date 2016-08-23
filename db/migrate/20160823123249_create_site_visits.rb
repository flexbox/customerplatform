class CreateSiteVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :site_visits do |t|
      t.references :unit, foreign_key: true
      t.string :title
      t.text :description
      t.date :date

      t.timestamps
    end
  end
end
