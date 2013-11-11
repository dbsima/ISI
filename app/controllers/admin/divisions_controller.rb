class Admin::DivisionsController < Admin::AdminController
  def index
     @divisions = Division.all
  end

  def new
  end

  def edit
     @division = Division.find params.require('id')
  end
end
