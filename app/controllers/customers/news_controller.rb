class Customers::NewsController < Customers::BaseController
  def index
    @news = @unit.building.lot.phase.news.order(date: :desc)
  end

  def show
  end
end
