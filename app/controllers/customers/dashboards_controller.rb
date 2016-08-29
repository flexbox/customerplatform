class Customers::DashboardsController < Customers::BaseController
  def show
    @unit = current_customer.units.first
    @units = current_customer.units
    @news = @unit.building.lot.phase.news
    @informations = @unit.information.all
    @timeline = @unit.payments.sort_by(&:id)
    @webcams = @unit.building.lot.phase.project.webcams
    @project = @unit.building.lot.phase.project

    @employee_id = @project.employee_projects.first.employee_id
    @employee = Employee.find(@employee_id)
  end
end
