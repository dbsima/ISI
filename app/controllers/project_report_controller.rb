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
  p @employees
end
