class CreateHelpdeskTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :helpdesk_tickets do |t|
      t.references :unit, foreign_key: true
      t.references :employee, foreign_key: true
      t.string :title
      t.text :description
      t.string :status, default: "open"

      t.timestamps
    end
  end
end
