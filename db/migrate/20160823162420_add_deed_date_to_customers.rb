class AddDeedDateToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :deed_date, :date
  end
end
