class AddCustomerRemarksToHandovers < ActiveRecord::Migration[5.0]
  def change
    add_column :handovers, :customer_remarks, :text
  end
end
