class AddDueDateToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :due_date, :date
  end
end
