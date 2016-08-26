class Employees::ProjectsController < Employees::BaseController

  def index #------------------------------------------------------
    # Displays all projects linked to the current_employee
    @projects = current_employee.projects
  end

  def show #-------------------------------------------------------
    @project = current_employee.projects.find(params[:id])
  end

  def new #--------------------------------------------------------
  end

  def create #-----------------------------------------------------
  end

  def edit #-------------------------------------------------------
  end

  def update #-----------------------------------------------------
  end

private ##################################################################

  def params_project
    params.fetch(:project, {}).permit(:commercial_name, :internal_name,
                                      :description, :plotsize, :longitude,
                                      :latitude)
  end

end


