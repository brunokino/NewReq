require 'rubygems'
require 'net/ldap'

ldap = Net::LDAP.new :host => "52.43.44.152",
     :port => 389,
     :auth => {
           :method => :simple,
           :username => "cn=service for lDAP connection,cn=Users,dc=intranet,dc=local",
           :password => "NewReq@123"
     }
     

dn = "cn=Eduardo Francisco,ou=NewReq,dc=intranet,dc=local"
                attr = {
                  :cn => "Eduardo Francisco",
                  :userPrincipalName => "esantos@intranet.local",
                  :sAMAccountName => "esantos",
                  :name => "Eduardo Francisco",
                  :displayname => "Eduardo Francisco",
                  :objectclass => "User",
                  :givenname => "Eduardo",
                  :sn => "Francisco",
                  :telephoneNumber => "(17)1111-1111",
                  :facsimileTelephoneNumber => "(17)2222-2222",
                  :homePhone => "(11)3212-3212",
                  :ipPhone => "123",
                  :mobile => "(11)99999-9999",
                  :pager => "456",
                  :mail => "esantos@gmail.com",
                  :l => "Curitiba",
                  :st => "PR",
                  :title => "Analista Fiscal",
                  :description => "Analista Fiscal",
                  :physicaldeliveryofficename => "Curitiba",
                  :c => "BR",
                  :department => "Fiscal",
                  :company => "Comfrio - Stock Tech",
                  :streetAddress => "Rua Street Fighter, 2",
                  :postalCode => "14781-000",
                  :postOfficeBox => "00000-001",
                  :proxyAddresses => "SMTP:esantos@gmail.com",
                  :wWWHomePage => "www.oscaralho.com.br",
                  :userPassword => "Teste@123*"
                  
                  
                }
    ldap.add(:dn => dn, :attributes => attr)