class CreateSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :suppliers do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile_number
      t.string :phone_number
      t.string :email
      t.string :company_name
      t.string :logo
      t.string :address

      t.timestamps
    end
  end
end
