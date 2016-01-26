json.array!(@logins) do |login|
  json.extract! login, :id, :name, :username, :password, :manager, :admin
  json.url login_url(login, format: :json)
end
