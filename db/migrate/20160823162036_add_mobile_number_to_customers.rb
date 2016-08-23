class AddMobileNumberToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :mobile_number, :string
  end
end
