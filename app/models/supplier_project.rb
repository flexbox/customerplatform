class SupplierProject < ApplicationRecord

  validates :project_id, :supplier_id, presence: true
  validates_uniqueness_of :project_id, :scope => [:supplier_id]

  belongs_to :supplier
  belongs_to :project
end
