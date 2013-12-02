class Admin::AuditController < ApplicationController
	def setLevel
		new_level = params.require(:new_level)
		a = Audit.first
		a.log_level = new_level
		a.save!
	end
  	
	def index
		
  	end
end
