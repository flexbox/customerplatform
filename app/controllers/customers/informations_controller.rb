class Customers::InformationsController < Customers::BaseController
  # /customers/units/:unit_id/informations(.:format)
  def index
    @informations = @unit.informations
  end

  # /customers/units/:unit_id/informations/:id(.:format)
  def show
  end
end
