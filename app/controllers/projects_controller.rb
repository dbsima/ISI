class ProjectsController < DeptChiefController
  def index
     @projects = Project.all
  end

  def edit
     @project = Project.find params.require(:id)
  end
  
  def update
     project = Project.find params.require(:id)
     old_name = project.name
     old_client_id = project.client_id
     project.update_attributes params.require(:project).permit(:name, :client_id)
     
     audit "a modificat proiectul #{old_name} cu clientul #{old_client_id} in #{project.name}, #{project.client_id}"
     redirect_to :projects, :alert => 'Proiectul a fost modificat'
  end
  
  def new
  end
  
  def create
     p = Project.create params.require(:project).permit(:name, :client_id)
     
     audit "a creat proiectul #{p.name} pentru #{p.client.name}"
     redirect_to :projects, :alert => 'Proiectul a fost adaugat'
  end
  
  def destroy
     p = Project.find(params.require(:id))
     audit "a sters proiectul #{p.name}"
     p.destroy
     
     redirect_to :projects, :alert => 'Proiectul a fost sters'
  end
end
