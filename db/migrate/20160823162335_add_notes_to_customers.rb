class AddNotesToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :notes, :text
  end
end
