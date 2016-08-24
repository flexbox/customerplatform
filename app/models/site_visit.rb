class SiteVisit < ApplicationRecord

  validates :unit_id, :title, :date, presence: true

  belongs_to :unit
  # has_many :documents, dependent: :destroy

end
