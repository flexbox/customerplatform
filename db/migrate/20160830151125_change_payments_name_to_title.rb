class ChangePaymentsNameToTitle < ActiveRecord::Migration[5.0]
  def change
    rename_column :payments, :name, :title
  end
end
