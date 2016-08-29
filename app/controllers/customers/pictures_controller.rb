class Customers::PicturesController < Customers::BaseController
  def index
    @pictures = Document.all
  end

  def show
  end

  private



end
