class Customers::HelpdeskTicketsController < Customers::BaseController

  def index
    unit_id = params[:unit_id]
    @tickets = HelpdeskTicket.where(unit_id:unit_id)
  end

  # /customers/units/:unit_id/informations/:id(.:format)
  def show
  end
end
