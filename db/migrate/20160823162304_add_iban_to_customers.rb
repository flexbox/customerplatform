class AddIbanToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :iban, :string
  end
end
