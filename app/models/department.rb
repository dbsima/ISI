class Department < ActiveRecord::Base
   # rails g model Department name:string division_id:integer
   # Vezi si migratiile generate pe 31.10 in /db/migrate
   belongs_to :division
   has_many :users
   has_many :tasks, :through => :users
   
   def chief
      users.select  {|u| u if u.has_role? :dept_chief }
   end
end
