json.array!(@detail_levels) do |detail_level|
  json.extract! detail_level, :id, :name
  json.url detail_level_url(detail_level, format: :json)
end
