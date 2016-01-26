json.array!(@sites) do |site|
  json.extract! site, :id, :company_id, :name, :city, :state, :country, :phone
  json.url site_url(site, format: :json)
end
