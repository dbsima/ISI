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
    
    p @user
    @timesheets = @user.tasks
  end

  def submit
    id = params.require :dashboard_id
    
    ms = MonthlySheet.find id.to_i
    ms.status = 'trimis'
    ms.save
    TimesheetMailer.submit(ms).deliver
    redirect_to :back, :alert => 'Pontaj lunar trimis spre aprobare!'
  end
  
  def reopen
     id = params.require :dashboard_id
     ms = MonthlySheet.find id.to_i
     ms.status = 'deschis'
     ms.save
     
     redirect_to :back, :alert => 'Pontaj redeschis pentru editare'
  end
  
  def accept
     id = params.require :dashboard_id
     ms = MonthlySheet.find id.to_i
     ms.status = 'acceptat'
     ms.save
     
     redirect_to dashboard_path(id), :alert => 'Pontajul a fost acceptat'
  end
  
  def reject
     id = params.require :id
     ms = MonthlySheet.find id.to_i

     begin
      ms.reason = params.require('reject').require('reason')
      ms.status = 'respins'
      ms.save
     
      redirect_to dashboard_path(id), :alert => 'Pontajul a fost respins'
     rescue ActionController::ParameterMissing
	redirect_to :back, :alert => 'Motivul respingerii este inexistent'
     end
  end
  
  def show
     id = params.require :id
    
     @ms = MonthlySheet.find id.to_i
     
     @timesheets = @ms.tasks
     
     render 'index'
  end
end
