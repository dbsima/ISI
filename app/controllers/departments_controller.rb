class DepartmentsController < ApplicationController
  def index
    @departments = current_user.division.departments
  end

  def show
    @department = Department.find params.require :id
    @projects = {}

    @department.tasks.pluck(:project_id).uniq.select { |x| x }.each do |p_id|
      @projects[Project.find(p_id).name] = @department.tasks.where(project_id: p_id).inject(0)  {|acc, x| acc + x.number_of_hours}
    end
  end
end
