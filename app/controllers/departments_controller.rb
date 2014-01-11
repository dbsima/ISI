class DepartmentsController < ApplicationController
  def index
    @departments = current_user.division.departments
  end

  def show
    @department = Department.find params.require :id
    @projects = {}
    @id = @department.id
    @sort = params.permit :sort

    @department.tasks.pluck(:project_id).uniq.select { |x| x }.each do |p_id|
      @projects[Project.find(p_id).name] = @department.tasks.where(project_id: p_id).inject(0)  {|acc, x| acc + x.number_of_hours}
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
