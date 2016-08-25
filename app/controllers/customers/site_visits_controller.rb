class Customers::SiteVisitsController < Customers::BaseController
  def index
    @sitevisits = SiteVisit.all
    @project = @unit.building.lot.phase.project

    @hash = Gmaps4rails.build_markers(@project) do |project, marker|
      marker.lat project.latitude
      marker.lng project.longitude
    end
  end

  def show
  end
end

