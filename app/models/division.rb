class Division < ActiveRecord::Base
   # creat cu rails g model Division name:string
   has_many :users, :through => :departments
   has_many :departments
end
