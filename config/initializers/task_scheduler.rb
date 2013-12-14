require 'rufus/scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '1m' do
   p 'Starting monthly_sheets creation'
   this_month = Date.today.at_beginning_of_month
   User.all.each do |u|
      u.monthly_sheets.create(month: this_month, status: 'open') unless u.monthly_sheets.find_by_month(this_month)
   end
end