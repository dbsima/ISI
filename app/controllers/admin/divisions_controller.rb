class Admin::DivisionsController < AdminController
  def index
     @divisions = Division.all
  end

  def new
  end
  
  def create
     begin
	Division.create params.require('division').permit('name')
	redirect_to :admin_divisions, :alert => 'Division created'
     rescue ActionController::ParameterMissing
	redirect_to :new_admin_division, :alert => 'Please input a division name'
     end
  end

  def edit
     @division = Division.find params.require('id')
  end
  
  def update
     begin
	Division.find(params.require('id')).update_attributes params.require('division').permit('name')
	redirect_to :admin_divisions, :alert => 'Division updated'
     rescue ActionController::ParameterMissing
	redirect_to :new_admin_division, :alert => 'Please input a division name'
     end 
  end
  
  def destroy
     Division.find(params.require('id')).destroy
     
     redirect_to :admin_divisions, :alert => 'Division removed'
  end
end
