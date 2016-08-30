class AddAnswerToHelpdeskTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :helpdesk_tickets, :answers, :text
  end
end
