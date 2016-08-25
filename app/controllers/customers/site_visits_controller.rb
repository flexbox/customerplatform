class Customers::SiteVisitsController < Customers::BaseController
  def index
      @sitevisits = SiteVisit.all
      @longitude = @unit.building.lot.phase.project.longitude
      @latitude = @unit.building.lot.phase.project.latitude
  end

  def show
  end

end
