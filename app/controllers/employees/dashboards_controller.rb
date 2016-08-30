class Employees::DashboardsController < Employees::BaseController
  def show
    @employee_projects = current_employee.projects


  end
end
