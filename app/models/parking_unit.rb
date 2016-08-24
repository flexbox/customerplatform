class ParkingUnit < ApplicationRecord

  validates :lot_id, :parking_name, presence: true
  validates_uniqueness_of :lot_id, :scope => [:parking_name]

  belongs_to :lot

end
