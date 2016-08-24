class EmployeeProject < ApplicationRecord

  validates :project_id, :employee_id, presence: true
  validates_uniqueness_of :project_id, :scope => [:employee_id]

  belongs_to :employee
  belongs_to :project
end
