class Employees::BaseController < ApplicationController
  before_action :set_project, if: :employee_signed_in?
  before_action :set_unit_employee, if: :employee_signed_in?
  before_action :authenticate_employee!
  layout "employee"

  private

    def set_project
      # @project will be nil if the current employee is not attached to any project
      @project = nil
      # unless current_employee.projects.nil? || current_employee.projects.empty?
      #   if params[:project_id]
      #     projects = current_employee.projects
      #     projects.each do |project|
      #       if project.id == params[:project_id]
      #         @project = project if @project.nil?
      #       end
      #     end
      #   else
      #     @project = current_employee.projects.first
      #   end
      # end
    end

  def set_unit_employee
    # @unit will be nil if there's no unit related to the current employee
    @unit = nil
    # unless current_employee.projects.nil? || current_employee.projects.empty?
    #   if params[:unit_id]
    #     un = Unit.find(params[:unit_id])
    #     emp = un.building.lot.phase.project.employees.first
    #     @unit = un if emp == current_employee
    #   else
    #     @unit = current_employee.projects.first.phases.first.lots.first.buildings.first.units.first
    #   end
    # end
  end

end

