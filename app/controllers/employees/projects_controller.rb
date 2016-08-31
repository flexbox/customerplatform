class Employees::ProjectsController < Employees::BaseController

  # destroy isn't implemented on purpose since destroying
  # a project would cascase destroy all its phases, lots,
  # buildings, parking lots, units, storage units, as well as
  # all events and documents related to that its units.
  # Project destruction can only be done by an admin and with
  # proper business confirmation. Currently thi is only possible
  # via the rails console.

  def index #------------------------------------------------------
    # Displays all projects linked to the current_employee
    @projects = current_employee.projects
  end

  def show #-------------------------------------------------------
    @project = current_employee.projects.find(params[:id])
  end

  def new #--------------------------------------------------------
    @project = Project.new
    respond_to do |format|
      format.html { redirect_to employees_projects_path }
      format.js
    end
  end

  def create #-----------------------------------------------------
    @project = Project.new(params_project)
    if @project.save
      EmployeeProject.create(project_id: @project.id,
                             employee_id:current_employee.id)
      redirect_to employees_project_path(@project)
    else
      render :new
    end
  end

  def edit #-------------------------------------------------------
    @project = current_employee.projects.find(params[:id])
  end

  def update #-----------------------------------------------------
    @project = current_employee.projects.find(params[:id])
    if @project.update(params_project)
      redirect_to employees_project_path(@project)
    else
      render :edit
    end
  end

private ##################################################################

  def params_project
    params.fetch(:project, {}).permit(:commercial_name, :internal_name,
                                      :description, :plotsize, :longitude,
                                      :latitude)
  end

end


