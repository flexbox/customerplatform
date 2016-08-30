class Employees::NewsController < Employees::BaseController

  before_action :set_init, except: [:destroy]

  def index #--------------------------------------------------------
    @news= News.where(phase_id: @phase)
  end

  def show #---------------------------------------------------------
    @news = @phase.news.find(params[:id])
  end

  def new #----------------------------------------------------------
     @news = News.new
  end

  def create #-------------------------------------------------------
    @news = News.new(params_news)
    @news.phase_id = @phase.id
    if @news.save
      redirect_to employees_project_news_path(@project.id, @news)
    else
      render :new
    end
  end

  def edit #---------------------------------------------------------
    @news = @phase.news.find(params[:id])
  end

  def update #-------------------------------------------------------
    @news = @phase.news.find(params[:id])
    if @news.update(params_news)
      redirect_to employees_project_news_path(@project.id, @news)
    else
      render :edit
    end
  end

  def destroy #------------------------------------------------------
  end


  private ###########################################################

  def set_init
    @project = current_employee.projects.find(params[:project_id])
    @phase = @project.phases.find(get_current_phase_id)
  end

  def params_news
    params.fetch(:news, {}).permit(:phase_id, :title,
                                   :description, :date,
                                   :picture, :picture_cache)
  end
end


