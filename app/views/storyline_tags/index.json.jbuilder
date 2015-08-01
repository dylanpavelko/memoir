json.array!(@storyline_tags) do |storyline_tag|
  json.extract! storyline_tag, :id, :name
  json.url storyline_tag_url(storyline_tag, format: :json)
end
