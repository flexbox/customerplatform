class AddOmniAuthToEmployees < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :provider, :string
    add_column :employees, :uid, :string
    add_column :employees, :facebook_picture_url, :string
    add_column :employees, :first_name, :string
    add_column :employees, :last_name, :string
    add_column :employees, :token, :string
    add_column :employees, :token_expiry, :datetime
  end
end
