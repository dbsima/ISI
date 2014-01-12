class UserReportController < ApplicationController
  include Concerns::DateSelect

  before_filter :get_date_params, :only => [:show]
  def index
    begin
      user = User.find_by_internal_id params.require(:search)
      if user
        dates = params.require :report_date

        redirect_to user_report_path(user.id, report_date: dates)
      else
        flash[:alert] = 'Angajatul nu a fost gasit'
      end
    rescue ActionController::ParameterMissing => e

    end
  end

  def show
    user =  params.require :id
    @id = user
    tasks = filter_tasks_by_date_params(User.find(user).tasks)
    p tasks
    projects_ids = tasks.collect {|t| t.project_id}.uniq.select { |x| x }
    p projects_ids
    @projects = {}
    p tasks
    projects_ids.each do |p_id|
      activities = tasks.select {|t| t if t.project_id == p_id}.collect {|t| t.activity}.uniq.select { |x| x }
      p_name = Project.find(p_id).name

      @projects[p_name] = {}
      @projects[p_name]['hours'] = tasks.select {|t| t if t.project_id == p_id}.inject(0)  {|acc, x| acc + x.number_of_hours}
      @projects[p_name]['activities'] = {}

      activities.each do |a|
        @projects[p_name]['activities'][a] = tasks.select {|t| t if t.project_id == p_id && t.activity == a}.inject(0)  {|acc, x| acc + x.number_of_hours}
      end
    end

    p @projects
  end
end
