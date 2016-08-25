class Customers::PaymentsController < Customers::BaseController
  def index
    @payments = current_customer.units.first.payments
  end

  def show
  end
end
