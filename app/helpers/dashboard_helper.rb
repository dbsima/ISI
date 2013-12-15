module DashboardHelper
   def submit_timesheet_button
     if @ms.status == 'deschis'
	button_to 'Trimite', dashboard_submit_path(@ms.id)
     elsif @ms.status == 'respins' && @ms.user == current_user
	button_to 'Redeschide', dashboard_reopen_path(@ms.id)
     end
   end
end
