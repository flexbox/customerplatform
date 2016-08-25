class Customers::SiteVisitsController < Customers::BaseController
  def index
      @sitevisits = SiteVisit.all
  end

  def show
  end

end
