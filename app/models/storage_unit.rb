class StorageUnit < ApplicationRecord
  belongs_to :building
  belongs_to :unit
end
