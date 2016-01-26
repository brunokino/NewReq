json.array!(@employees) do |employee|
  json.extract! employee, :id, :name, :username, :login_id, :company_id, :site_id, :department, :phone, :phoneext, :mobilephone
  json.url employee_url(employee, format: :json)
end
