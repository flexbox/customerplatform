class Project < ApplicationRecord

  validates :commercial_name, :internal_name, presence: true
  validates :commercial_name, uniqueness: { case_sensitive: false }
  validates :internal_name, uniqueness: { case_sensitive: false }

  has_many :employee_projects, dependent: :destroy
  has_many :employees, through: :employee_projects

  has_many :supplier_projects, dependent: :destroy
  has_many :suppliers, through: :supplier_projects

  has_many :phases, dependent: :destroy

  has_many :webcams, dependent: :destroy
end
