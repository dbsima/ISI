class Task < ActiveRecord::Base
   belongs_to :daily_sheet
   belongs_to :user
   belongs_to :project

   def event_start_time
    created_at
   end

def start_time
    created_at
end

   def name
        number_of_hours.to_s + ' ore ' + activity
  end
end
