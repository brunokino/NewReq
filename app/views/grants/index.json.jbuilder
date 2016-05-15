json.array!(@grants) do |grant|
  json.extract! grant, :id, :username, :name, :cn, :manager, :admin
  json.url grant_url(grant, format: :json)
end
