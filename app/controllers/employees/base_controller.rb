class Employees::BaseController < ApplicationController
  before_action :set_project, if: :employee_signed_in?
  before_action :set_unit_employee, if: :employee_signed_in?
  before_action :authenticate_employee!
  layout "employee"

  ###################################################################

  private

    def set_project #------------------------------------------------
      # @project will be nil if the current employee is not attached
      # to any project
      @project = nil
      unless current_employee.projects.nil? || current_employee.projects.empty?
        if params[:project_id]
          projects = current_employee.projects
          projects.each do |project|
            if project.id == params[:project_id]
              @project = project if @project.nil?
            end
          end
        else
          @project = current_employee.projects.first
        end
      end
    end

  def set_unit_employee #--------------------------------------------
    # @unit will be nil if there's no unit related to the current
    # employee
    @unit = nil
    unless current_employee.projects.nil? || current_employee.projects.empty?
      if params[:unit_id] # if there is a current unit
        un = Unit.find(params[:unit_id])
        emp = un.building.lot.phase.project.employees.first
        @unit = un if emp == current_employee
      end
    end
  end

  def set_current_phase_id(phase)  #---------------------------------
    # keeps track of the current phase since
    # phase_id does not appear in all routes
    # to lots
    session[:current_phase_id] = phase.id
  end

  def get_current_phase_id
    return session[:current_phase_id]
  end

  def set_current_lot_id(lot) #--------------------------------------
    # keeps track of the current lot since
    # lot_id does not appear in all routes
    # to buildings
    session[:current_lot_id] = lot.id
  end

  def get_current_lot_id
    return session[:current_lot_id]
  end

  def set_current_building_id(building) #----------------------------
    # keeps track of the current lot since
    # lot_id does not appear in all routes
    # to buildings
    session[:current_building_id] = building.id
  end

  def get_current_building_id
    return session[:current_building_id]
  end

  def set_current_unit_id(unit) #------------------------------------
    # keeps track of the current lot since
    # lot_id does not appear in all routes
    # to buildings
    session[:current_unit_id] = unit.id
  end

  def get_current_unit_id
    return session[:current_unit_id]
  end

end

