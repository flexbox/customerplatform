class AddPictureToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :picture, :string
  end
end
