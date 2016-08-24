class Decision < ApplicationRecord

  validates :unit_id, :title, :date, :due_date, presence: true

  belongs_to :unit

end
