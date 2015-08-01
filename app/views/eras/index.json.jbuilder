json.array!(@eras) do |era|
  json.extract! era, :id, :name, :startDate, :endDate
  json.url era_url(era, format: :json)
end
