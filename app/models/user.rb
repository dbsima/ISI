class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # trebuie adaugate has_many/one, belongs_to
  belongs_to :department
  belongs_to :division
  
  # Roles
  include RoleModel
  
  roles_attribute :roles_mask
  
  roles :manager, :division_chief, :dept_chief, :employee
end