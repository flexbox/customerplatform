class Employees::NewsController < Employees::BaseController
  def index
    # /employees/projects/:project_id/news(.:format)

    # @phase = Phase.where(project_id: params[:project_id])
    @news= News.where(phase_id: @phase)
    # @phase_id = @phase.id
    # @news = News.find(@phase_id)
    # @projects = current_employee.projects.all
  end

  def show
    # /employees/projects/:project_id/news/:id(.:format)


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


