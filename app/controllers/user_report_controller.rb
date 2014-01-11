class UserReportController < ApplicationController
  def index
    begin
      user = User.find_by_internal_id params.require(:search)
      if user
        dates = params.require :report_date

        redirect_to user_report_path(user.id, dates)
      else
        flash[:alert] = 'Angajatul nu a fost gasit'
      end
    rescue ActionController::ParameterMissing => e

    end
  end

  def show
    user =  params.require :id

    begin
      pars = params.require(:report_date).permit :date_start, :date_finish
    rescue ActionController::ParameterMissing => e

    end

    tasks = User.find(user).tasks
    p tasks
    projects_ids = tasks.pluck(:project_id).uniq.select { |x| x }
    @projects = {}
    projects_ids.each do |p_id|
      activities = tasks.where(project_id: p_id).pluck(:activity).uniq.select { |x| x }
      p_name = Project.find(p_id).name

      @projects[p_name] = {}
      @projects[p_name]['hours'] = tasks.where(project_id: p_id).inject(0)  {|acc, x| acc + x.number_of_hours}
      @projects[p_name]['activities'] = {}

      activities.each do |a|
        @projects[p_name]['activities'][a] = tasks.where(project_id: p_id, activity: a).inject(0)  {|acc, x| acc + x.number_of_hours}
      end
    end

    p @projects
  end
end
