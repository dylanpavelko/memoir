json.array!(@user_has_viewing_preferences) do |user_has_viewing_preference|
  json.extract! user_has_viewing_preference, :id, :user_id, :viewingPreference_id
  json.url user_has_viewing_preference_url(user_has_viewing_preference, format: :json)
end
