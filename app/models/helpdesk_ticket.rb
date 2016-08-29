class HelpdeskTicket < ApplicationRecord

  validates :unit_id, :employee_id, :title, :description, :status, presence: true

  belongs_to :unit
  belongs_to :employee
  has_many :helpdesk_comments


end
