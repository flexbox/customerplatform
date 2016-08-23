class ParkingUnit < ApplicationRecord
  belongs_to :lot
  belongs_to :unit
end
