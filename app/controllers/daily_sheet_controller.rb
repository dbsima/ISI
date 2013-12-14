class DailySheetController < ApplicationController
  def index
     begin
	@user = current_user
	calendar = params.require('daily_sheet').permit "date"
	date = Date.new calendar['date(1i)'].to_i, calendar['date(2i)'].to_i, calendar['date(3i)'].to_i
	
	@ds = @user.daily_sheets.find_or_create_by date: date
	p @ds.tasks
     rescue ActionController::ParameterMissing
        
     end
  end

  def new
     begin
	@ds = params.require('daily_sheet')
	@daily_sheet = DailySheet.find_by_id @ds.to_i
     rescue ActionController::ParameterMissing
	redirect_to :daily_sheet_index
     end
  end
  
  def create
     daily_sheet = params.require('daily_sheet').require('id')
     task  = params.require('task').permit 'activity', 'project_id', 'client', 'number_of_hours'
     
     if current_user.daily_sheets.find(daily_sheet).tasks.create(task)
	redirect_to :daily_sheet_index, alert: 'Pontaj efectuat!'
     else
	redirect_to :daily_sheet_index, alert: 'Eroare la adaugarea pontajului!'
     end
  end

  def edit
  end
end
