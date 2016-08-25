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
  {firstname: "Jon", lastname: "Targaryen", username: "jtargaryen", title: "CEO", description: "CEO", company_id: "1", site_id: "1", department: "Directors", grant_id: "5", phone: "", mobile: "+55(11)99999-9999", homephone: "+55(11)3322-1100", ipphone: "1100", pager: nil, Office: nil, City: "1", address: "", State: "1", Country: "1", postalcode: "", pobox: "", website: "", status: nil, ldapserver_id: "1", publicdomain_id: "1"},
  {firstname: "Maisa", lastname: "Diniz", username: "mdiniz", title: "CIO", description: "CIO", company_id: "1", site_id: "1", department: "Information of Technology", grant_id: "5", phone: "", mobile: "", homephone: "", ipphone: "", pager: nil, Office: nil, City: "1", address: "", State: "1", Country: "1", postalcode: "", pobox: "", website: "", status: nil, ldapserver_id: "1", publicdomain_id: "1"},
  {firstname: "Guilherme", lastname: "Cardoso", username: "gcardoso", title: "CIO", description: "CIO", company_id: "1", site_id: "1", department: "IT", grant_id: "5", phone: "", mobile: "", homephone: "", ipphone: "", pager: nil, Office: nil, City: "1", address: "", State: "1", Country: "1", postalcode: "", pobox: "", website: "", status: nil, ldapserver_id: "1", publicdomain_id: "1"},
  {firstname: "Rogério", lastname: "Silva", username: "rsilva", title: "DevOps Engineer", description: "DevOps Engineer", company_id: "1", site_id: "1", department: "Information of Technology", grant_id: "5", phone: "", mobile: "(17)99999-1122", homephone: "", ipphone: "", pager: nil, Office: nil, City: "1", address: "", State: "1", Country: "1", postalcode: "", pobox: "", website: "", status: nil, ldapserver_id: "1", publicdomain_id: "1"}
])
Newuserldap.create!([
  {dn: "CN=Jon Targaryen,OU=NewReq,DC=intranet,DC=local", objectclass: "User", givenname: "Jon", sn: "Targaryen", cn: "Jon Targaryen", name: "Jon Targaryen", displayname: "Jon Targaryen", userPrincipalName: "jtargaryen@intranet.local", sAMAccountName: "jtargaryen", title: "CEO", description: "CEO", company: "NewReq Company", department: "Directors", telephoneNumber: "", facsimileTelephoneNumber: "", homePhone: "+55(11)3322-1100", ipPhone: "1100", mobile: "+55(11)99999-9999", physicalDeliveryOfficeName: "São Paulo", l: "São Paulo", st: "SP", streetAddress: "", postalCode: "", postOfficeBox: "", c: "BR", manager: "CN=Bruno Kinoshita,OU=NewReq,DC=intranet,DC=local", mail: "jtargaryen@mydomain.com", proxyAddresses: "SMTP:jtargaryen@mydomain.com", wWWHomePage: "", userPassword: "Teste@123*", newusers_id: "21"},
  {dn: "CN=Maisa Diniz,OU=NewReq,DC=intranet,DC=local", objectclass: "User", givenname: "Maisa", sn: "Diniz", cn: "Maisa Diniz", name: "Maisa Diniz", displayname: "Maisa Diniz", userPrincipalName: "mdiniz@intranet.local", sAMAccountName: "mdiniz", title: "CIO", description: "CIO", company: "NewReq Company", department: "Information of Technology", telephoneNumber: "", facsimileTelephoneNumber: "", homePhone: "", ipPhone: "", mobile: "", physicalDeliveryOfficeName: "São Paulo", l: "São Paulo", st: "SP", streetAddress: "", postalCode: "", postOfficeBox: "", c: "BR", manager: "CN=Bruno Kinoshita,OU=NewReq,DC=intranet,DC=local", mail: "mdiniz@mydomain.com", proxyAddresses: "SMTP:mdiniz@mydomain.com", wWWHomePage: "", userPassword: "Teste@123*", newusers_id: "22"},
  {dn: "CN=Guilherme Cardoso,OU=NewReq,DC=intranet,DC=local", objectclass: "User", givenname: "Guilherme", sn: "Cardoso", cn: "Guilherme Cardoso", name: "Guilherme Cardoso", displayname: "Guilherme Cardoso", userPrincipalName: "gcardoso@intranet.local", sAMAccountName: "gcardoso", title: "CIO", description: "CIO", company: "NewReq Company", department: "IT", telephoneNumber: "", facsimileTelephoneNumber: "", homePhone: "", ipPhone: "", mobile: "", physicalDeliveryOfficeName: "São Paulo", l: "São Paulo", st: "SP", streetAddress: "", postalCode: "", postOfficeBox: "", c: "BR", manager: "CN=Bruno Kinoshita,OU=NewReq,DC=intranet,DC=local", mail: "gcardoso@mydomain.com", proxyAddresses: "SMTP:gcardoso@mydomain.com", wWWHomePage: "", userPassword: "Teste@123*", newusers_id: "23"},
  {dn: "CN=Rogério Silva,OU=NewReq,DC=intranet,DC=local", objectclass: "User", givenname: "Rogério", sn: "Silva", cn: "Rogério Silva", name: "Rogério Silva", displayname: "Rogério Silva", userPrincipalName: "rsilva@intranet.local", sAMAccountName: "rsilva", title: "DevOps Engineer", description: "DevOps Engineer", company: "NewReq Company", department: "Information of Technology", telephoneNumber: "", facsimileTelephoneNumber: "", homePhone: "", ipPhone: "", mobile: "(17)99999-1122", physicalDeliveryOfficeName: "São Paulo", l: "São Paulo", st: "SP", streetAddress: "", postalCode: "", postOfficeBox: "", c: "BR", manager: "CN=Bruno Kinoshita,OU=NewReq,DC=intranet,DC=local", mail: "rsilva@mydomain.com", proxyAddresses: "SMTP:rsilva@mydomain.com", wWWHomePage: "", userPassword: "Teste@123*", newusers_id: "24"}
])
Publicdomain.create!([
  {domain: "mydomain.com"},
  {domain: "myotherdomain.com"}
])
Site.create!([
  {company_id: "1", name: "São Paulo", city: "São Paulo", state: "SP", country: "BR", phone: "+551133221100"},
  {company_id: "1", name: "Washington", city: "Washington", state: "D.C", country: "US", phone: ""},
  {company_id: "3", name: "Curitiba", city: "Curitiba", state: "PR", country: "BR", phone: ""},
  {company_id: "3", name: "London", city: "London", state: "", country: "GB", phone: ""}
])
