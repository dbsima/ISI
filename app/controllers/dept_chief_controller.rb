class DeptChiefController < ApplicationController
   before_filter :check_access
   
   def check_access
      redirect_to :dashboard_index unless current_user.has_role? :dept_chief
   end
end
