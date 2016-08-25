class Customers::NewsController < Customers::BaseController
  def index
    @news = News.all
  end

  def show
  end
end
