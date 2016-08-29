class Employees::StorageUnitsController < Employees::BaseController

  before_action :set_init, except: [:destroy]

  def index #--------------------------------------------------------
    @sus = @building.storage_units.order("storage_name")
  end

  def show #---------------------------------------------------------
    @su = @building.storage_units.find(params[:id])
    if @su.unit_id.nil?
      @unit = "n/a"
    else
      @unit = Unit.find(@su.unit_id).unit_name
    end
  end

  def new #----------------------------------------------------------
    @su = StorageUnit.new
  end

  def create #-------------------------------------------------------
    @su = StorageUnit.new(params_su)
    @su.building_id = @building.id
    if @su.save
      redirect_to employees_project_storage_unit_path(@project.id, @su)
    else
      render :new
    end
  end

  def edit #---------------------------------------------------------
    @su = @building.storage_units.find(params[:id])
  end

  def update #-------------------------------------------------------
    # if unit id == blank then unit id = nil
    @su = @building.storage_units.find(params[:id])
    if @su.update(params_su)
      redirect_to employees_project_storage_unit_path(@project.id, @su)
    else
      render :edit
    end
  end

  def destroy #------------------------------------------------------
  end

private ##################################################################

  def set_init
    @project = current_employee.projects.find(params[:project_id])
    @phase = @project.phases.find(get_current_phase_id)
    @lot = @phase.lots.find(get_current_lot_id)
    @building = @lot.buildings.find(get_current_building_id)
    # We can only select storage attached to the same building
    @unitcollection = Unit.where("building_id = ?", @building.id)
  end

  def params_su
    params.fetch(:storage_unit, {}).permit(:building_id, :storage_name,
                                           :storage_size, :unit_id)
  end

end
