module DailySheetHelper
   def extra_hours(t)
      if @acc < 8
	 res = 'normal_hours'
      else
	 res = 'extra_hours'
      end
      @acc += t.number_of_hours
      res
   end
end
