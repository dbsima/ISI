module DashboardHelper
   def submit_timesheet_button
     if @ms.status == 'open'
	button_to 'Trimite', dashboard_submit_path(@ms.id)
     elsif @ms.status == 'rejected' && @ms.user == current_user
	button_to 'Redeschide', dashboard_reopen_path(@ms.id)
     elsif @ms.status == 'submitted' && @ms.user.department.chief == current_user
	button_to 'Accepta', dashboard_accept_path(@ms.id)
	button_to 'Resping', dashboard_reject_path(@ms.id)
     end
   end
end
