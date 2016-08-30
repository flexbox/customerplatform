class Customers::InformationsController < Customers::BaseController
  # /customers/units/:unit_id/informations(.:format)
  def index
    @informations = @unit.informations
  end

  # /customers/units/:unit_id/informations/:id(.:format)
  def show
    @information = Information.find(params[:id])
    @document = Document.find(@information.document_id)
    respond_to do |format|
      format.html { redirect_to customers_unit_information_path(@unit, @information) }
      format.js
    end
  end

  def read
    @information = Information.find(params[:id])
    @information.read = true
  end

end
