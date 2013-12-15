class TasksController < ApplicationController
  def edit
     @task = Task.find params.require(:id)
  end
  
  def update
     old_t = t = Task.find(params.require(:id))
     t.update_attributes params.require(:task).permit(:activity, :project_id, :number_of_hours)
     
     audit "a modificat task-ul #{t.id} din #{old_t.activity}, #{old_t.project_id}, #{old_t.number_of_hours} in #{t.activity} #{t.project_id} #{t.number_of_hours}"
     redirect_to :dashboard_index, :alert => 'Pontajul a fost modificat'
  end
  
  def destroy
     t = Task.find(params.require(:id))
     audit "a sters task-ul #{t.activity} #{t.project_id} #{t.number_of_hours}"
     
     t.destroy
     
     redirect_to :back, alert: "Pontajul a fost sters"
  end
end
