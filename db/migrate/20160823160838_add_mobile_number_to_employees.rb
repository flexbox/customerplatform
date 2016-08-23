class AddMobileNumberToEmployees < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :mobile_number, :string
  end
end
