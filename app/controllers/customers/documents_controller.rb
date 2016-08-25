class Customers::DocumentsController < Customers::BaseController
  def index
    @documents = Document.all
    @kindU = kind_unique(@documents)
  end

  def show
  end

  private


  def kind_unique(documents)
    @documents.select(:kind).map(&:kind).uniq
  end
end
