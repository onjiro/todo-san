json.array!(@users) do |user|
  json.extract! user, :id, :provider, :name, :image_url, :email, :access_token
  json.url user_url(user, format: :json)
end
