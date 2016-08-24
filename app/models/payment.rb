class Payment < ApplicationRecord

  validates :unit_id, :name, :amount, :status, :due_date, presence: true

  belongs_to :unit
  # has_many :documents, dependent: :destroy
  # belongs_to :document

end
