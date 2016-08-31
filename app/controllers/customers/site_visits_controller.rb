class Customers::SiteVisitsController < Customers::BaseController
  def index
    unit_id = @unit.id
    @sitevisits = SiteVisit.where(unit_id: unit_id)
    @project = @unit.building.lot.phase.project
    @current_page_sitevisits = true

    @hash = Gmaps4rails.build_markers(@project) do |project, marker|
      marker.lat project.latitude
      marker.lng project.longitude
    end

    unit_id = @unit.id
    @handovers = Handover.where(unit_id:unit_id)
    unless @handovers.nil? || @handovers.empty?
      if @handovers.length > 2
        flash[:alert] = "There can only be two handovers."
      end
    end

    @longitude_project = @project.longitude
    @latitude_project = @project.latitude

    @unit

    @longitude_customer = @unit.customer.longitude
    @latitude_customer = @unit.customer.latitude
  end



private ##################################################################

  def params_handover
    params.fetch(:handover, {}).permit(:unit_id, :title, :description,
                                       :date, :customer_remarks,
                                       :employee_remarks, :document_id)
  end
end

