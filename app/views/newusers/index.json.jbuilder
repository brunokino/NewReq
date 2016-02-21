json.array!(@newusers) do |newuser|
  json.extract! newuser, :id, :firstname, :lastname, :username, :title, :description, :company_id, :site_id, :department, :grant_id, :phone, :mobile, :homephone, :ipphone, :pager, :Office, :City, :address, :State, :Country, :postalcode, :pobox, :website
  json.url newuser_url(newuser, format: :json)
end
