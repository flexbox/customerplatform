class Employees::LotsController < Employees::BaseController

  before_action :set_init, except: [:destroy]

  def index #--------------------------------------------------------
    @lots = @phase.lots
  end

  def show #---------------------------------------------------------
    @lot = @phase.lots.find(params[:id])
    set_current_lot_id(@lot)
  end

  def new #----------------------------------------------------------
    @lot = Lot.new
  end

  def create #--------------------------------------------------------
    @lot = Lot.new(params_lot)
    @lot.phase_id = @phase.id
    if @lot.save
      redirect_to employees_project_lot_path(@project.id, @lot)
    else
      render :new
    end
  end

  def edit #---------------------------------------------------------
    @lot = @phase.lots.find(params[:id])
  end

  def update #-------------------------------------------------------
    @lot = @phase.lots.find(params[:id])
    if @lot.update(params_lot)
      redirect_to employees_project_lot_path(@project.id, @lot)
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
  end

  def params_lot
    params.fetch(:lot, {}).permit(:phase_id, :lot_number,
                                  :description, :cadastral_reference,
                                  :lot_size, :picture, :picture_cache)
  end

end



