module DashboardHelper
   def submit_timesheet_button
     if @ms.status == 'open'
	button_to 'Submit', dashboard_submit_path(@ms.id)
     end
   end
end
