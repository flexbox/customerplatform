class Payment < ApplicationRecord
  belongs_to :unit
  belongs_to :document
end
