class DashboardController < ApplicationController
  def index
    @user = current_user
    
    if current_user.has_role? :manager
        @role = 'manager'
    elsif current_user.has_role? :employee
        @role = 'employee'
    elsif current_user.has_role? :dept_chief
        @role = 'dept_chief'
    end
    
    p @user
    @timesheets = @user.tasks
  end

  def new
    
  end
end
