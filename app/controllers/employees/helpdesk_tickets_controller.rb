class Employees::HelpdeskTicketsController < Employees::BaseController

  def index#--------------------------------------------------------
    @tickets = HelpdeskTicket.where(employee_id:current_employee.id)
  end

  def show #--------------------------------------------------------
    @ticket = HelpdeskTicket.find(params[:id])
  end


  def edit #--------------------------------------------------------
    @ticket = HelpdeskTicket.find(params[:id])
    respond_to do |format|
      format.html { redirect_to edit_employees_helpdesk_ticket_path(@ticket.id) }
      format.js
    end
  end


  def update #--------------------------------------------------------
    @ticket = HelpdeskTicket.find(params[:id])
    if @ticket.update(params_helpdesk_ticket)
      redirect_to employees_helpdesk_tickets_path and return
    else
      render :edit
    end
  end



end



private

  def params_helpdesk_ticket
    params.fetch(:helpdesk_ticket, {}).permit(:title, :description, :answers, :status)
  end
