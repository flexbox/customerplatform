class Employees::BuildingsController < Employees::BaseController

  before_action :set_init, except: [:destroy]

  def index
    @buildings = @lot.buildings
  end

  def show
    @building = @lot.buildings.find(params[:id])
    set_current_building_id(@building)
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(params_building)
    @building.lot_id = @lot.id
    if @building.save
      redirect_to employees_project_building_path(@project.id, @building)
    else
      render :new
    end
  end

  def edit
    @building = @lot.buildings.find(params[:id])
  end

  def update
    @building = @lot.buildings.find(params[:id])
    if @building.update(params_building)
      redirect_to employees_project_building_path(@project.id, @building)
    else
      render :edit
    end
  end


private ##################################################################

  def set_init
    @project = current_employee.projects.find(params[:project_id])
    @phase = @project.phases.find(get_current_phase_id)
    @lot = @phase.lots.find(get_current_lot_id)
  end

  def params_building
    params.fetch(:building, {}).permit(:lot_id, :building_name,
                                       :description, :address,
                                       :floors, :shared_space,
                                       :elevator_amount,
                                       :picture, :picture_cache)
  end

end



