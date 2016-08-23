class AddTitleToEmployees < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :title, :string
  end
end
