class ProjectReportController < ApplicationController
  include Concerns::DateSelect

  before_filter :get_date_params, :only => [:show]

  def show
    @id = project_id =  params.require :id

    tasks = filter_tasks_by_date_params Project.find(project_id).tasks

    @employees = {}
    tasks.collect {|t| t.user_id}.uniq.select { |x| x }.each do |u_id|
      @employees[u_id] = tasks.select {|t| t.user_id == u_id}.inject(0)  {|acc, x| acc + x.number_of_hours}
    end
  end

  def search
    begin
      search_string = params.require :search
    rescue ActionController::ParameterMissing
      search_string = '.*'
    end
    p search_string
    @search = true
    @projects = []
    #current_user.department.tasks.pluck(:project_id).uniq.select { |x| x }.each do |p_id|
    #@projects = Project.all
    Project.all.each do |p|
      #p = Project.find(p_id)
      p p
      if Regexp.new(search_string).match p.name
        p 'a intrat'
        @projects << p
      end
    end
    p @projects

    render 'projects/index'
  end

  def index
    #begin
    #  pars = params.require(:report_date).permit :date_start, :date_finish
    #
    #rescue ActionController::ParameterMissing => e
    #
    #end
    #@sort = params.permit :sort
    #
    #@projects = {}
    #tasks = current_user.department.tasks

    redirect_to department_path(current_user.department.id, params)

    #tasks.pluck(:project_id).uniq.select { |x| x }.each do |p_id|
    #  @projects[Project.find(p_id).name] = tasks.where(project_id: p_id).inject(0)  {|acc, x| acc + x.number_of_hours}
    #end
    #
    #if @sort[:sort]
    #  if @sort[:sort] == 'asc'
    #      @projects = @projects.sort_by { |k, v| v }
    #  else
    #    @projects = @projects.sort_by { |k, v| -v }
    #  end
    #end
  end
end
