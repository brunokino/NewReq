json.array!(@publicdomains) do |publicdomain|
  json.extract! publicdomain, :id, :domain
  json.url publicdomain_url(publicdomain, format: :json)
end
