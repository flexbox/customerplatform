class Customers::HandoversController < Customers::BaseController
  def index
    @unit = current_customer.units.find(params[:unit_id])
  end

  def show
  end

  def edit
  end

  def update
  end

end
