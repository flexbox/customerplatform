class Customers::NewsController < Customers::BaseController
  def index
    @news = @unit.building.lot.phase.news.order(date: :desc)
    @current_page_news = true
  end

  def show
  end
end
