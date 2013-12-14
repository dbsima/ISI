class DashboardController < ApplicationController
  def index
    @user = current_user
    begin
       month = params.require :month
       year = params.require :year
       @ms = @user.monthly_sheets.find_by_month Date.new(year.to_i, month.to_i, 1)
       @this_month = true if Date.new(year.to_i, month.to_i, 1) == Date.today.at_beginning_of_month
    rescue ActionController::ParameterMissing
       @this_month = true
       @ms = @user.monthly_sheets.find_by_month Date.today.at_beginning_of_month
    end
    
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

  def submit
    id = params.require :dashboard_id
    
    ms = MonthlySheet.find id.to_i
    ms.status = 'submitted'
    ms.save
    TimesheetMailer.submit(ms).deliver
    redirect_to :dashboard_index, :alert => 'Pontaj lunar trimis spre aprobare!'
  end
end
