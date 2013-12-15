class EmployeesController < ApplicationController
  def index
     if current_user.has_role? :employee
	redirect_to :dashboard_index
     elsif current_user.has_role? :dept_chief
	@employees = User.where :department => current_user.department
     elsif current_user.has_role? :div_chief
	@employees = User.where :division => current_user.division
     elsif current_user.has_role? :manager
	@employees = User.all
     end
  end
end
