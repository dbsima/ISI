class AvailableActivities < ActiveRecord::Base
   def self.list
      all.pluck :name
   end
end
