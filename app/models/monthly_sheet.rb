class MonthlySheet < ActiveRecord::Base
   belongs_to :user
   has_many :daily_sheets
end
