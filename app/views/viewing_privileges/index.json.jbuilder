json.array!(@viewing_privileges) do |viewing_privilege|
  json.extract! viewing_privilege, :id, :name, :characterTag, :storylineTag, :startDate, :endDate
  json.url viewing_privilege_url(viewing_privilege, format: :json)
end
