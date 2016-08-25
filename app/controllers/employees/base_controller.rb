class Employees::BaseController < ApplicationController
  before_action :set_project, if: :employee_signed_in?
  before_action :set_unit_employee, if: :employee_signed_in?
  before_action :authenticate_employee!
  layout "employee"

  private

    def set_project
    if params[:project_id]
      @project = current_employee.projects.find(params[:project_id])
    else
      @project = current_employee.projects.first
    end
  end

  def set_unit_employee
    if params[:unit_id]
      # TODO - THIS ONE WILL NOT WORK, we need to have the current id of every step... faking it by taking first now:
      @unit = current_employee.projects.first.phases.first.lots.first.buildings.first.units.find(params[:unit_id])
    else
      @unit = current_employee.projects.first.phases.first.lots.first.buildings.first.units.first
    end
  end

end

