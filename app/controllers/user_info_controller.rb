class UserInfoController < ApplicationController
  def index
	@user = current_user
	if @user.department
		division = Division.find(@user.department.division_id)
		@user.division.name = division.name
	end
	@user.save!

	p @user
  end
end
