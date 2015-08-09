class ViewingPreference < ActiveRecord::Base

	def includes(group)
		if self.startDate == Date.new(1984,1,1)
			start=Date.new(1000,1,1)
		else
			start=self.startDate
		end
		@included = false
		if group.isIncludedInDateRange(start, self.endDate)
			@included = true
		end
		return @included
	end


end
