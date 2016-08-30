class Customers::NewsController < Customers::BaseController
  def index
    @news = @unit.building.lot.phase.news.order(date: :desc)
    @current_page_news = true
  end

  def show
    @news = News.find(params[:id])
    respond_to do |format|
      format.html { redirect_to customers_unit_news_path(@unit, @news) }
      format.js
    end
  end
end
