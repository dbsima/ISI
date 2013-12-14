require 'rufus/scheduler'

scheduler = Rufus::Scheduler.start_new

scheduler.cron '22 19 1 * *' do
   
end