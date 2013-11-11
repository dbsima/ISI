class Admin::AdminController < ApplicationController
   before_filter :check_admin
   
   def check_admin
      redirect_to :dashboard_index unless current_user.has_role? :admin
   end
end