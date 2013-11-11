class Admin::UsersController < Admin::AdminController
  def index
    @users = User.all
  end

  def new
    
  end

  def create
    par = params.require('user').permit(:first_name, :last_name, :email, :password, :internal_id, :division, :department, :role)
    p par
    User.create!(
       first_name: par[:first_name], 
       last_name: par[:last_name], 
       email: par[:email], 
       password: par[:password],
       internal_id: par[:internal_id],
       department_id: par[:department],
       roles_mask: par[:role]
   )
#     User.create! name: p
    redirect_to :admin_users
  end

  def edit
  end
end
