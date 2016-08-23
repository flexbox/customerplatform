class Decision < ApplicationRecord
  belongs_to :unit
  belongs_to :supplier
  belongs_to :document
end
