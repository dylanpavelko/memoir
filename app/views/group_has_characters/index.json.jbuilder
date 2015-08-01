json.array!(@group_has_characters) do |group_has_character|
  json.extract! group_has_character, :id, :group_id, :characterTag_id
  json.url group_has_character_url(group_has_character, format: :json)
end
