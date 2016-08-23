class AddBirthdayToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :birthday, :date
  end
end
