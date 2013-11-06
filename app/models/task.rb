class Task < ActiveRecord::Base
   belongs_to :daily_sheet
   belongs_to :user
   belongs_to :project
end
