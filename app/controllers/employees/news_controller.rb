class Employees::NewsController < Employees::BaseController
  def index
    # /employees/projects/:project_id/news(.:format)

    @news = current_employee.projects.first.phases.first.news

  end

  def show
    # /employees/projects/:project_id/news/:id(.:format)
    @news = (params[:id])

  end

  def new
    # /employees/projects/:project_id/phases/:phase_id/news/new(.:format)
    @news = News.new
  end

  def create
    # /employees/projects/:project_id/phases/:phase_id/news(.:format)
    @news = News.new(params_news)
    @news.save
  end

  def edit
    # /employees/projects/:project_id/news/:id(.:format)
  end

  def update
    # /employees/projects/:project_id/news/:id(.:format)
  end

  def destroy
    # /employees/projects/:project_id/news/:id(.:format)
  end


  private

  def params_news
     params.require(:news).permit(:title, :description, :date)
  end
end


