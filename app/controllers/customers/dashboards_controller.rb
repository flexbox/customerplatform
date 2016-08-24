class Customers::DashboardsController < Customers::BaseController
  def show
    @unit = Unit.find_by(customer_id:current_customer.id)
  end
end
