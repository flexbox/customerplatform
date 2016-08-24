class Customers::DecisionsController < Customers::BaseController
  def index
    @unit = current_customer.units.find(params[:unit_id])
  end

  def show
  end

  def approve
  end

  def reject
  end
end
