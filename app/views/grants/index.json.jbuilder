json.array!(@grants) do |grant|
  json.extract! grant, :id, :username, :manager, :admin
  json.url grant_url(grant, format: :json)
end
