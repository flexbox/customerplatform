class Customers::PicturesController < Customers::BaseController
  def index
      unit_id = params[:unit_id]
      @pictures = Picture.where(unit_id: unit_id)
  end

  def show
  end

end
