json.array!(@users) do |user|
  json.extract! user, :id, :organization
  json.url user_url(user, format: :json)
end
