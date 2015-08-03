class ViewingPrivilege < ActiveRecord::Base

	def includes(group)
		@included = false
		if group.hasStoryline(self.storylineTag_id)
			if group.isIncludedInDateRange(self.startDate, self.endDate)
				@included = true
			end
		end
		if group.hasCharacter(self.characterTag_id)
			if group.isIncludedInDateRange(self.startDate, self.endDate)
				@included = true
			end
		end
		return @included
	end

end
