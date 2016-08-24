class Supplier < ApplicationRecord

  validates :first_name, :last_name, :mobile_number, :company_name, :address, :email, presence: true
  validates :mobile_number, uniqueness: true
  validates :email, uniqueness: { case_sensitive: false }

  has_many :supplier_projects, dependent: :destroy
  has_many :projects, through: :supplier_projects
  has_many :decisions, dependent: :nullify

end
