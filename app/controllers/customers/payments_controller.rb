class Customers::PaymentsController < Customers::BaseController
  def index
    @unit = current_customer.units.find(params[:unit_id])
  end

  def show
  end
end
