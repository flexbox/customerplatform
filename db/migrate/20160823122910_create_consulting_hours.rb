class CreateConsultingHours < ActiveRecord::Migration[5.0]
  def change
    create_table :consulting_hours do |t|
      t.references :customer, foreign_key: true
      t.references :employee, foreign_key: true
      t.integer :elapsed_time
      t.text :description

      t.timestamps
    end
  end
end
