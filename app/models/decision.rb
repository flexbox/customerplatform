class Decision < ApplicationRecord

  validates :unit_id, :title, :date, :due_date, presence: true

  belongs_to :unit
  belongs_to :supplier

end
