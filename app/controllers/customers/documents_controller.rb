class Customers::DocumentsController < Customers::BaseController
  def index
    @documents = Document.all
  end

  def show
  end
end
