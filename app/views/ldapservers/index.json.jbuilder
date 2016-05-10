json.array!(@ldapservers) do |ldapserver|
  json.extract! ldapserver, :id, :domain, :host, :port, :attributename, :base, :username, :password, :method
  json.url ldapserver_url(ldapserver, format: :json)
end
