class AddWelcomeBoxToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :welcome_box, :string
  end
end
