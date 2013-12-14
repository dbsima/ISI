class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :authenticate_user!
  
  def audit(action)
     if Audit.first.log_level <= current_user.roles_mask
	$AUDIT.tagged(Time.now, current_user.roles.first.to_s, current_user.id, 
	               current_user.first_name + " " + current_user.last_name) { $AUDIT.info action }
     end
  end
end
