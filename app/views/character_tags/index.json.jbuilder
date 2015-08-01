json.array!(@character_tags) do |character_tag|
  json.extract! character_tag, :id, :name, :relationship, :relationshipType_id, :nickname
  json.url character_tag_url(character_tag, format: :json)
end
