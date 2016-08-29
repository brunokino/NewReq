Company.create!([
  {name: "NewReq Company", note: "Default Company."},
  {name: "Fullstack Company", note: ""}
])
Grant.create!([
  {username: "bkinoshita", manager: true, admin: true, cn: "CN=Bruno Kinoshita,OU=NewReq,DC=intranet,DC=local", name: "Bruno Kinoshita"}
])
Ldapserver.create!([
  {host: "52.43.44.152", port: "389", attributename: "sAMAccountName", base: "CN=Users,DC=intranet,DC=local", username: "CN=Service for LDAP Connection,CN=Users,DC=intranet,DC=local", password: "NewReq@123", method: "simple", domain: "intranet.local", description: "INTRANET"},
  {host: "172.16.0.1", port: "389", attributename: "sAMAccountName", base: "ou=usuarios,dc=newdomain,dc=local", username: "svc-ldap", password: "123123", method: "simple", domain: "newdomain.local", description: "NEWDOMAIN"}
])
Newuser.create!([
  {firstname: "Jon", lastname: "Targaryen", username: "jtargaryen", title: "CEO", description: "CEO", company_id: "1", site_id: "1", department: "Directors", grant_id: "1", phone: "", mobile: "+55(11)99999-9999", homephone: "+55(11)3322-1100", ipphone: "1100", pager: nil, Office: nil, City: "1", address: "", State: "1", Country: "1", postalcode: "", pobox: "", website: "", status: nil, ldapserver_id: "1", publicdomain_id: "1"},
  {firstname: "Maisa", lastname: "Diniz", username: "mdiniz", title: "CIO", description: "CIO", company_id: "1", site_id: "1", department: "Information of Technology", grant_id: "1", phone: "", mobile: "", homephone: "", ipphone: "", pager: nil, Office: nil, City: "1", address: "", State: "1", Country: "1", postalcode: "", pobox: "", website: "", status: nil, ldapserver_id: "1", publicdomain_id: "1"},
  {firstname: "Guilherme", lastname: "Cardoso", username: "gcardoso", title: "CIO", description: "CIO", company_id: "1", site_id: "1", department: "IT", grant_id: "1", phone: "", mobile: "", homephone: "", ipphone: "", pager: nil, Office: nil, City: "1", address: "", State: "1", Country: "1", postalcode: "", pobox: "", website: "", status: nil, ldapserver_id: "1", publicdomain_id: "1"},
  {firstname: "Rogério", lastname: "Silva", username: "rsilva", title: "DevOps Engineer", description: "DevOps Engineer", company_id: "1", site_id: "1", department: "Information of Technology", grant_id: "1", phone: "", mobile: "(17)99999-1122", homephone: "", ipphone: "", pager: nil, Office: nil, City: "1", address: "", State: "1", Country: "1", postalcode: "", pobox: "", website: "", status: nil, ldapserver_id: "1", publicdomain_id: "1"}
])
Publicdomain.create!([
  {domain: "mydomain.com"},
  {domain: "myotherdomain.com"}
])
Site.create!([
  {company_id: "1", name: "São Paulo", city: "São Paulo", state: "SP", country: "BR", phone: "+551133221100"},
  {company_id: "1", name: "Washington", city: "Washington", state: "D.C", country: "US", phone: ""},
  {company_id: "2", name: "Curitiba", city: "Curitiba", state: "PR", country: "BR", phone: ""},
  {company_id: "2", name: "London", city: "London", state: "", country: "GB", phone: ""}
])
