class Customers::InformationsController < Customers::BaseController
  # /customers/units/:unit_id/informations(.:format)
  def index
    @informations = @unit.informations
  end

  # /customers/units/:unit_id/informations/:id(.:format)
  def show
    @information = Information.find(params[:id])
    unless @information.document_id.nil?
      @document = Document.find(@information.document_id)
    end
    respond_to do |format|
      format.html { redirect_to customers_unit_information_path(@unit, @information) }
      format.js
    end
  end

  def read
    @information = Information.find(params[:id])
    @information.update(read: true)
    redirect_to root_path
  end

end
