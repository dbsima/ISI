class MonthlySheet < ActiveRecord::Base
   belongs_to :user
   has_many :daily_sheets
   has_many :tasks, :through => :daily_sheets
end
