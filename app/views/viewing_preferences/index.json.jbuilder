json.array!(@viewing_preferences) do |viewing_preference|
  json.extract! viewing_preference, :id, :textDetailLevel, :imageDetailLevel, :characterTag, :storylineTag, :startDate, :endDate
  json.url viewing_preference_url(viewing_preference, format: :json)
end
