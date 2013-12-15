class TasksController < ApplicationController
  def edit
     @task = Task.find params.require(:id)
  end
  
  def update
     Task.find(params.require(:id)).update_attributes params.require(:task).permit(:activity, :project_id, :number_of_hours)
   
     redirect_to :dashboard_index, :alert => 'Pontajul a fost modificat'
  end
end
