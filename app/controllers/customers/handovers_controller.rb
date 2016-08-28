class Customers::HandoversController < Customers::BaseController
  def index #------------------------------------------------------
    # displays only handovers pertaining to the current unit
    unit_id = @unit.id
    @handovers = Handover.where(unit_id:unit_id)
    unless @handovers.nil? || @handovers.empty?
      if @handovers.length > 2
        flash[:alert] = "There can only be two handovers."
      end
    end
  end

  def edit #-------------------------------------------------------
    @handover = Handover.find(params[:id])
    respond_to do |format|
      format.html { redirect_to edit_customers_unit_handover_path(@unit, @handover) }
      format.js
    end
  end

  def update #-----------------------------------------------------
    @handover = Handover.find(params[:id])
    if @handover.update(params_handover)
      flash[:notice] = 'Remarks Saved'
      redirect_to customers_unit_handovers_path and return
    else
      flash[:alert] = 'Error saving'
      redirect_back(fallback_location: root_path) and return
    end
  end

private ##################################################################

  def params_handover
    params.fetch(:handover, {}).permit(:unit_id, :title, :description,
                                       :date, :customer_remarks,
                                       :employee_remarks, :document_id)
  end

end
