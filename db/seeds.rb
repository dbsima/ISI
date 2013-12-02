# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
['lucru din sediu', 'deplasare la client', 'sedinta', 'curs'].each do |a|
   AvailableActivities.create :name => a
end

div = Division.create! name: 'IT'
department = Department.create! name: 'admin', division: div

admin = User.create department: department, email: 'a@a.a', password: 'p0liSUXhardc0r3', first_name: 'Admin', last_name: 'Admin', roles_mask: 1

