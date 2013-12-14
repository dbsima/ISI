class ProjectsController < DeptChiefController
  def index
     @projects = Project.all
  end

  def edit
  end

  def new
  end
end
