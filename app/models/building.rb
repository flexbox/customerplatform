class Building < ApplicationRecord

  mount_uploader :picture, PhotoUploader

  validates :lot_id, :building_name, :floors, presence: true
  validates_uniqueness_of :lot_id, :scope => [:building_name]

  belongs_to :lot
  has_many :units, dependent: :destroy
  has_many :storage_units, dependent: :destroy

end
