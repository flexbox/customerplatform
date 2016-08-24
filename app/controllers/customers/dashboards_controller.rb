class Customers::DashboardsController < Customers::BaseController
  def show
    @units = Unit.where(customer_id:current_customer.id)
  end
end
