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
     
  end
  
  def create
     
  end

  def edit
  end
end
