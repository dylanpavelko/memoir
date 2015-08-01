json.array!(@group_has_storylines) do |group_has_storyline|
  json.extract! group_has_storyline, :id, :group_id, :storylineTag_id
  json.url group_has_storyline_url(group_has_storyline, format: :json)
end
