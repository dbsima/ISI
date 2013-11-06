class DailySheet < ActiveRecord::Base
   belongs_to :monthly_sheet
   has_many :tasks
end
