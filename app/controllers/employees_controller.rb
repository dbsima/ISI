class EmployeesController < ApplicationController
  def index
     if current_user.has_role? :employee
	redirect_to :dashboard_index
     elsif current_user.has_role? :dept_chief
	@employees = User.where(:department => current_user.department).select {|e| e.roles_mask > 8 }
     elsif current_user.has_role? :division_chief
	@employees = current_user.division.users.select {|e| e.roles_mask > 4}   
     elsif current_user.has_role? :manager
	@employees = User.where('roles_mask > 2')
     end
  end
end
