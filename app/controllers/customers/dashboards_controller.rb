class Customers::DashboardsController < Customers::BaseController
  def show
    @unit = current_customer.units.first
    @units = current_customer.units
    @news = @unit.building.lot.phase.news
    @informations = @unit.information.all
    @timeline = @unit.payments.sort_by(&:id)
  end
end
