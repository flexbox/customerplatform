class Customers::HelpdeskTicketsController < Customers::BaseController

  def index#--------------------------------------------------------
    unit_id = params[:unit_id]
    @tickets = HelpdeskTicket.where(unit_id:unit_id)
  end

  def show #--------------------------------------------------------
  end


  def new #--------------------------------------------------------
    @helpdesk_ticket = HelpdeskTicket.new

    respond_to do |format|
      format.html { redirect_to new_customers_unit_helpdesk_ticket_path(@unit, @helpdesk_ticket) }
      format.js
    end
  end


  def create #--------------------------------------------------------
    @helpdesk_ticket = HelpdeskTicket.new(params_helpdesk_ticket)
    @helpdesk_ticket.unit_id = @unit.id
    project_id = @unit.building.lot.phase.project.id
    @employee_project = EmployeeProject.find_by(project_id:project_id)
    @helpdesk_ticket.employee_id = @employee_project.employee_id
    if @helpdesk_ticket.save!
      redirect_to customers_unit_helpdesk_tickets_path(@unit) and return
    else
      render :new
    end
  end

end



private

  def params_helpdesk_ticket
    params.fetch(:helpdesk_ticket, {}).permit(:title, :description)
  end
