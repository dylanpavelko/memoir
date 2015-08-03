json.array!(@user_has_viewing_privileges) do |user_has_viewing_privilege|
  json.extract! user_has_viewing_privilege, :id, :user_id, :viewingPrivilege_id
  json.url user_has_viewing_privilege_url(user_has_viewing_privilege, format: :json)
end
