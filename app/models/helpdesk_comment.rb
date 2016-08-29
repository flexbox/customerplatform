class HelpdeskComment < ApplicationRecord

  validates :helpdesk_ticket_id, :employee_id, :comment, presence: true

  belongs_to :helpdesk_ticket_id
  belongs_to :employee

end

