class DashboardController < ApplicationController
  def index
    if current_user.has_role? :manager
        @role = 'manager'
    elsif current_user.has_role? :employee
        @role = 'employee'
    elsif current_user.has_role? :dept_chief
        @role = 'dept_chief'
    end
    
    @timesheets = DailySheet.all
  end
end
