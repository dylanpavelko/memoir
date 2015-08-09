class ViewingPreference < ActiveRecord::Base

	def includes(group)
		if self.startDate == Date.new(1984,1,1)
			start=Date.new(1000,1,1)
		elsif self.startDate == Date.new(1985,1,1)
			start=Date.new(1800,1,1)
		elsif self.startDate == Date.new(1986,1,1)
			start=Date.new(1911,1,1)	
		elsif self.startDate == Date.new(1987,1,1)
			start=Date.new(1958,1,1)
		elsif self.startDate == Date.new(1988,1,1)
			start=Date.new(1988,1,1)
		else
			start=self.startDate
		end

		if self.endDate == Date.new(1984,1,1)
			endDateRange=Date.new(1000,1,1)
		elsif self.endDate == Date.new(1985,1,1)
			endDateRange=Date.new(1800,1,1)
		elsif self.endDate == Date.new(1986,1,1)
			endDateRange=Date.new(1911,1,1)	
		elsif self.endDate == Date.new(1987,1,1)
			endDateRange=Date.new(1958,1,1)
		elsif self.endDate == Date.new(1988,1,1)
			endDateRange=Date.new(1988,10,1)
		else
			endDateRange=self.endDate
		end

		@included = false
		if group.isIncludedInDateRange(start, endDateRange)
			@included = true
		end
		return @included
	end


end
