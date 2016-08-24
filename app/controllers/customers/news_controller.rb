class Customers::NewsController < Customers::BaseController
  def index
    @unit = Unit.where(customer_id: current_customer.id)
  end

  def show
  end
end
