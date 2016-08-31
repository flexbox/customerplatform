class Employees::UnitsController < Employees::BaseController

  before_action :set_init, except: [:destroy]

  def index #--------------------------------------------------------
    @units = @building.units.order("unit_name")
  end

  def show #---------------------------------------------------------
    @unit = @building.units.find(params[:id])
    set_current_unit_id(@unit)
    if @unit.customer_id.nil?
      @customer = "n/a"
    else
      cust = Customer.find(@unit.customer_id)
      @customer = "#{cust.first_name} #{cust.last_name}"
    end
    @sold = @unit.sold ? "Yes" : "No"
    @storage_units = @building.storage_units.where("unit_id = ?", @unit.id)
  end

  def new #----------------------------------------------------------
    @unit = Unit.new
    @unit.consulting_hours = 15
    @unit.sold = false
  end

  def create #-------------------------------------------------------
    @unit = Unit.new(params_unit)
    @unit.building_id = @building.id
    if @unit.save
      redirect_to employees_project_unit_path(@project.id, @unit)
    else
      render :new
    end
  end

  def edit #---------------------------------------------------------
    @unit = @building.units.find(params[:id])
  end

  def update #-------------------------------------------------------
    @unit = @building.units.find(params[:id])
    if @unit.update(params_unit)
      redirect_to employees_project_unit_path(@project.id, @unit) and return
    else
      render :edit
    end
  end

  def save_phase(phase)
    set_current_phase_id(phase)
  end
  helper_method :save_phase

private ##################################################################

  def set_init
    @project = current_employee.projects.find(params[:project_id])
    @phase = @project.phases.find(get_current_phase_id)
    @lot = @phase.lots.find(get_current_lot_id)
    @building = @lot.buildings.find(get_current_building_id)
  end

  def params_unit
    params.fetch(:unit, {}).permit(:building_id, :unit_name, :description,
                                   :address, :floor_number, :orientation,
                                   :floor_size, :sold, :price_initial_budget,
                                   :price_contracted, :land_value,
                                   :construction_value, :registration_tax_land,
                                   :vat_construction, :sales_person,
                                   :customer_id, :consulting_hours,
                                   :picture, :picture_cache)
  end
end
