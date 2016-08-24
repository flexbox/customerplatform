class StorageUnit < ApplicationRecord

  validates :building_id, :storage_name, :storage_size, presence: true
  validates_uniqueness_of :building_id, :scope => [:storage_name]

  belongs_to :building

end
