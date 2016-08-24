class AddDateToConsultingHours < ActiveRecord::Migration[5.0]
  def change
    add_column :consulting_hours, :date, :date
  end
end
