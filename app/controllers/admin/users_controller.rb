class Admin::UsersController < Admin::AdminController
  def index
    @users = User.all
  end

  def new
    
  end

  def create
    par = params.require('user').permit(:first_name, :last_name, :email, :password, :internal_id, :division, :department_id, :roles_mask)
    p par
    User.create!(
       first_name: par[:first_name], 
       last_name: par[:last_name], 
       email: par[:email], 
       password: par[:password],
       internal_id: par[:internal_id],
       department_id: par[:department_id],
       roles_mask: par[:roles_mask]
   )
#     User.create! name: p
    redirect_to :admin_users
  end

  def edit
     @user = User.find params.require('id')
  end
  
  def update
     @user = User.find params.require('id')
     
     @user.update_attributes params.require('user').permit(:first_name, :last_name, :department_id, :email, :internal_id, :roles_mask)
     
     @user.department.division_id = params.require('user').permit :division_id
     @user.save!
     
#      if params.require('user').permit(:password)[:password]
     redirect_to :admin_users, :alert => 'User data modified'
  end
  
  def destroy
     User.find(params.require('id')).destroy
     
     redirect_to :admin_users, :alert => 'User removed'
  end
end
