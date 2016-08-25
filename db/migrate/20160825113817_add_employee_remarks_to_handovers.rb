class AddEmployeeRemarksToHandovers < ActiveRecord::Migration[5.0]
  def change
    add_column :handovers, :employee_remarks, :text
  end
end
