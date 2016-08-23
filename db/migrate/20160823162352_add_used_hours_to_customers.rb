class AddUsedHoursToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :used_hours, :integer
  end
end
