class Decision < ApplicationRecord

  validates :unit_id, :title, :date, :due_date, :kind, presence: true
  validates :status,
    :inclusion  => { :in => ['pending', 'approved', 'rejected']}

  belongs_to :unit
  belongs_to :supplier

end
