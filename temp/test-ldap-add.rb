require 'rubygems'
require 'net/ldap'

ldap = Net::LDAP.new :host => "130.211.138.238",
     :port => 389,
     :auth => {
           :method => :simple,
           :username => "cn=svc-ldap,ou=usuarios,dc=intranet,dc=local",
           :password => "NewReq@123"
     }
     

dn = "cn=Bruno Kinoshita,ou=usuarios,dc=intranet,dc=local"
                attr = {
                  :cn => "Bruno Kinoshita",
                  :userPrincipalName => "kino@intranet.local",
                  :sAMAccountName => "kino",
                  :name => "Bruno Kinoshita",
                  :displayname => "Bruno Kinoshita",
                  :objectclass => "User",
                  :givenname => "Bruno",
                  :sn => 'Kinoshita',
                  :telephoneNumber => "(11)3333-3333",
                  :mail => "brunokino@gmail.com",
                  :l => "Barretos",
                  :st => "SP",
                  :title => "Supervisor de Infraestrutura",
                  :description => "Supervisor de Infraestrutura",
                  :physicaldeliveryofficename => "Office name",
                  :initials => "BOK",
                  :c => "BR",
                  :department => "Tecnologia da Informação",
                  :company => "Company name"
                  
                  
                  
                }
    ldap.add(:dn => dn, :attributes => attr)