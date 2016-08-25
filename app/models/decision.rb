class Decision < ApplicationRecord

  validates :unit_id, :title, :date, :due_date, presence: true
  validates :status,
    :inclusion  => { :in => ['pending', 'approved', 'rejected']}

  belongs_to :unit
  belongs_to :supplier

end
