class Phase < ApplicationRecord

  validates :project_id, :phase_number, :picture, presence: true
  validates_uniqueness_of :project_id, :scope => [:phase_number]

  belongs_to :project
  has_many :lots, dependent: :destroy
  has_many :news, dependent: :destroy

end
