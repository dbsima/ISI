class ProjectsController < DeptChiefController
  def index
     @projects = Project.all
  end

  def edit
     @project = Project.find params.require(:id)
  end
  
  def update
     project = Project.find params.require(:id)
     project.update_attributes params.require(:project).permit(:name, :client_id)
     
     redirect_to :projects, :alert => 'Proiectul a fost modificat'
  end
  
  def new
  end
  
  def create
     Project.create params.require(:project).permit(:name, :client_id)
     
     redirect_to :projects, :alert => 'Proiectul a fost adaugat'
  end
  
  def destroy
     Project.find(params.require(:id)).destroy
     
     redirect_to :projects, :alert => 'Proiectul a fost sters'
  end
end
