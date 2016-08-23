class AddSigningDateToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :signing_date, :date
  end
end
