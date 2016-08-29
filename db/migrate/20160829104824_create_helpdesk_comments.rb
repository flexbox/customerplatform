class CreateHelpdeskComments < ActiveRecord::Migration[5.0]
  def change
    create_table :helpdesk_comments do |t|
      t.references :helpdesk_ticket, foreign_key: true
      t.references :employee, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
