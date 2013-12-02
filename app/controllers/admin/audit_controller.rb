class Admin::AuditController < ApplicationController
	def set_level
		new_level = params.require(:audit).require(:log_level)
		a = Audit.first
		a.log_level = new_level
		a.save!
		
		redirect_to :admin_audit_index
	end
  	
	def index
		@current_level = Audit.first.log_level
  	end
end
