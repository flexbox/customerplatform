class Employees::PhasesController < Employees::BaseController

  # destroy is not implement. If you need to destroy a phase
  # during testing, use the rails console to do so.
  # Beware that destroy will cascade destroy all related records.

  before_action :set_project, except: [:destroy]

  def index #--------------------------------------------------------
    # @project = current_employee.projects.find(params[:project_id])
    @phases = @project.phases

  end

  def show #---------------------------------------------------------
    # @project = current_employee.projects.find(params[:project_id])
    @phase = @project.phases.find(params[:id])
    set_current_phase_id(@phase) # stores current phase id if we need to
                                 # access lots, as phase_id is not in
                                 # the url
  end

  def new #----------------------------------------------------------
    # @project = current_employee.projects.find(params[:project_id])
    @phase = Phase.new
    respond_to do |format|
      format.html { redirect_to new_employees_project_lot_path(@project.id) }
      format.js
    end
  end

  def create #-------------------------------------------------------
    # @project = current_employee.projects.find(params[:project_id])
    @phase = Phase.new(params_phase)
    @phase.project_id = @project.id
    if @phase.save
      redirect_to employees_project_phase_path(@project.id, @phase)
    else
      render :new
    end
  end

  def edit #---------------------------------------------------------
    # @project = current_employee.projects.find(params[:project_id])
    @phase = @project.phases.find(params[:id])
  end

  def update #-------------------------------------------------------
    # @project = current_employee.projects.find(params[:project_id])
    @phase = @project.phases.find(params[:id])
    if @phase.update(params_phase)
      redirect_to employees_project_phase_path(params[:project_id], @phase)
    else
      render :edit
    end
  end

  def save_phase(phase)
    set_current_phase_id(phase)
  end
  helper_method :save_phase

private ##################################################################

  def set_project
    @project = current_employee.projects.find(params[:project_id])
  end

  def params_phase
    params.fetch(:phase, {}).permit(:project_id, :phase_number,
                                    :description, :duration, :picture,
                                    :picture_cache)
  end

end

