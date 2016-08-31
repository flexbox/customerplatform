class Employees::CustomersController< Employees::BaseController

  def index
    @customers = Customer.all.order(last_name: :asc)
  end

  def show
    @customer = Customer.find(params[:id])
    @units = Unit.where("customer_id = " + params[:id])
  end

end
