class Employees::ParkingUnitsController < Employees::BaseController

  before_action :set_init, except: [:destroy]

  def index # -------------------------------------------------------
    @parking_units = @lot.parking_units.order("parking_name")
  end

  def show # --------------------------------------------------------
    @pu = @lot.parking_units.find(params[:id])
  end

  def new # ---------------------------------------------------------
    @pu = ParkingUnit.new
  end

  def create # ------------------------------------------------------
    @pu = ParkingUnit.new(params_pu)
    @pu.unit_id = nil if @pu.unit_id == ""
    @pu.lot_id = @lot.id
    if @pu.save
      redirect_to employees_project_parking_unit_path(@project.id, @pu)
    else
      render :new
    end
  end

  def edit # --------------------------------------------------------
    @pu = @lot.parking_units.find(params[:id])
  end

  def update # ------------------------------------------------------
    @pu = @lot.parking_units.find(params[:id])
    if @pu.update(params_pu)
      redirect_to employees_project_parking_unit_path(@project.id, @pu)
    else
      render :edit
    end
  end

  def destroy # -----------------------------------------------------
  end

private ##################################################################

  def set_init
    @project = current_employee.projects.find(params[:project_id])
    @phase = @project.phases.find(get_current_phase_id)
    @lot = @phase.lots.find(get_current_lot_id)
  end

  def params_pu
    params.fetch(:parking_unit, {}).permit(:lot_id, :parking_name, :unit_id)
  end

end
