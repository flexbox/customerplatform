class Information < ApplicationRecord

  validates :unit_id, :title, :date, presence: true

  belongs_to :unit
  # has_many :documents, dependent: :destroy
  belongs_to :document
end
