class SupplierProject < ApplicationRecord
  belongs_to :supplier
  belongs_to :project
end
