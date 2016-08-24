class ConsultingHour < ApplicationRecord
  validates :elapsed_time, :customer_id, :employee_id, presence: true

  belongs_to :customer
  belongs_to :employee
end
