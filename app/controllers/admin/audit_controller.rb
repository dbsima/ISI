class Admin::AuditController < ApplicationController
	def set_level
		new_level = params.require(:new_level)
		a = Audit.first
		a.log_level = new_level
		a.save!
		
		redirect_to :admin_audit_index
	end
  	
	def index
		
  	end
end
