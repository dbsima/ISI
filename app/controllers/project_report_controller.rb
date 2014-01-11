class ProjectReportController < ApplicationController
  def show
    project_id =  params.require :id

    begin
      pars = params.require(:report_date).permit :date_start, :date_finish
    rescue ActionController::ParameterMissing => e

    end

    tasks = Project.find(project_id).tasks

    @employees = {}
    tasks.pluck(:user_id).uniq.select { |x| x }.each do |u_id|
      @employees[u_id] = tasks.where(user_id: u_id).inject(0)  {|acc, x| acc + x.number_of_hours}
    end
  end

  def index
    begin
      pars = params.require(:report_date).permit :date_start, :date_finish

    rescue ActionController::ParameterMissing => e

    end
    @sort = params.permit :sort

    @projects = {}
    tasks = current_user.department.tasks

    tasks.pluck(:project_id).uniq.select { |x| x }.each do |p_id|
      @projects[Project.find(p_id).name] = tasks.where(project_id: p_id).inject(0)  {|acc, x| acc + x.number_of_hours}
    end

    if @sort[:sort]
      if @sort[:sort] == 'asc'
          @projects = @projects.sort_by { |k, v| v }
      else
        @projects = @projects.sort_by { |k, v| -v }
      end
    end
  end
end
