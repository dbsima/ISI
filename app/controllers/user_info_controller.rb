class UserInfoController < ApplicationController
  def index
	if current_user.has_role? :admin
	   redirect_to :admin_users
	   
	   return
	end
	@user = current_user
	if @user.department
		division = Division.find(@user.department.division_id)
		@user.division.name = division.name
	end
	@user.save!

	p @user
  end
end
