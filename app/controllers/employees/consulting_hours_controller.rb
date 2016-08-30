class Employees::ConsultingHoursController < Employees::BaseController

  before_action :set_init, except: [:destroy]

  def index #--------------------------------------------------------
    # how many hours is the client entitled to ?
    @units = Unit.where("customer_id = " + params[:customer_id])
    @consulting_quota = 0
    @units.each do |unit|
      if unit.consulting_hours.nil? || unit.consulting_hours == 0 # if consulting_hours is not
        @consulting_quota += Unit.DEFAULT_CONSULTING_HOURS        # set, we use the default value
      else                                                        # specified in the Unit model.
        @consulting_quota += unit.consulting_hours
      end
    end

    # how many hours have been used ?
    @chs = ConsultingHour.where("customer_id = " + params[:customer_id])
    @used_hours = 0
    @chs.each do |ch|
      @used_hours += ch.elapsed_time
    end

  end

  def show #---------------------------------------------------------
    # not implemented, too little to show for a dedicated form.
  end

  def new #----------------------------------------------------------
    @ch = ConsultingHour.new
  end

  def create #-------------------------------------------------------
    @ch = ConsultingHour.new(params_ch)
    @ch.customer_id = @customer.id
    @ch.employee_id = @current_employee.id
    if @ch.save
      redirect_to employees_customer_consulting_hours_path(@customer.id)
    else
      render :new
    end
  end

  def edit #---------------------------------------------------------
    @ch = @customer.consulting_hours.find(params[:id])
  end

  def update #-------------------------------------------------------
    @ch = @customer.consulting_hours.find(params[:id])
    if @ch.update(params_ch)
      redirect_to employees_customer_consulting_hours_path(@customer.id)
    else
      render :edit
    end

  end

  def destroy #------------------------------------------------------

  end

private ##################################################################

  def set_init
    @customer = Customer.find(params[:customer_id])
  end

  def params_ch
    params.fetch(:consulting_hour, {}).permit(:elapsed_time, :customer_id,
                                               :employee_id, :description,
                                               :date)
  end

end
