class Customers::DecisionsController < Customers::BaseController

  def index #-------------------------------------------------------
    # list Decisions pertaining to the current unit
    unit_id = params[:unit_id]
    @decisions = Decision.where(unit_id:unit_id)
    @unit = Unit.find(unit_id)
    @current_page_decisions = true
  end

  def show # -------------------------------------------------------
    @decision = Decision.find(params[:id])
    @supplier = Supplier.find(@decision.supplier_id)
    @unit = Unit.find(@decision.unit_id)
    @document = Document.find(@decision.document_id)
    respond_to do |format|
      format.html { redirect_to customers_unit_decision_path(@unit, @decision) }
      format.js
    end
  end

  def approve # ----------------------------------------------------
    @decision = Decision.find(params[:id])
    if @decision.status.downcase == "pending"
      @decision.status = "approved"
      if @decision.update(params_decision)
        flash[:notice] = 'Decision approved'
        redirect_back(fallback_location: root_path) and return
      else
        flash[:alert] = 'Error saving'
        redirect_back(fallback_location: root_path) and return
      end
    else
      flash[:alert] = "Decision is already set (" + @decision.status.downcase + ")"
      redirect_back(fallback_location: root_path) and return
    end
  end

  def reject # -------------------------------------------------------
    @decision = Decision.find(params[:id])
    if @decision.status.downcase == "pending"
      @decision.status = "rejected"
      if @decision.update(params_decision)
        flash[:notice] = 'Decision rejected'
        redirect_back(fallback_location: root_path) and return
      else
        flash[:alert] = 'Error saving'
        redirect_back(fallback_location: root_path) and return
      end
    else
      flash[:alert] = "Decision is already set (" + @decision.status.downcase + ")"
      redirect_back(fallback_location: root_path) and return
    end
  end


private ##################################################################

  def params_decision
    params.fetch(:decision, {}).permit(:unit_id, :supplier_id, :document_id,
                                     :title, :description, :date, :due_date,
                                     :status)
  end

end
