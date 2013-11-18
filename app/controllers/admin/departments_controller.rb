class Admin::DepartmentsController < ApplicationController
  def index
     @departments = Department.all
  end

  def new
  end

  def create
     begin
	Department.create params.require('department').permit('name')
	redirect_to :admin_departments, :alert => 'Department created'
     rescue ActionController::ParameterMissing
	redirect_to :new_admin_department, :alert => 'Please input a department name'
     end
  end

  def edit
     @department = Department.find params.require('id')
  end
  
  def update
     begin
	Department.find(params.require('id')).update_attributes params.require('department').permit('name')
	redirect_to :admin_departments, :alert => 'Department updated'
     rescue ActionController::ParameterMissing
	redirect_to :new_admin_department, :alert => 'Please input a department name'
     end 
  end
  
  def destroy
     Department.find(params.require('id')).destroy
     
     redirect_to :admin_departments, :alert => 'Department removed'
  end
end
