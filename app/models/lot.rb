class Lot < ApplicationRecord

  mount_uploader :picture, PhotoUploader

  validates :phase_id, :lot_number, presence: true
  validates_uniqueness_of :phase_id, :scope => [:lot_number]

  belongs_to :phase
  has_many :buildings, dependent: :destroy
  has_many :parking_units, dependent: :destroy

end
