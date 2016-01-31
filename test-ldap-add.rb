require 'rubygems'
require 'net/ldap'

ldap = Net::LDAP.new :host => "104.199.128.84",
     :port => 389,
     :auth => {
           :method => :simple,
           :username => "cn=teste,ou=usuarios,dc=intranet,dc=local",
           :password => "rails@BR001"
     }
     

dn = "cn=Bruno Kinoshita,ou=usuarios,dc=intranet,dc=local"
                attr = {
                  :cn => "Bruno Kinoshita",
                  :name => "Bruno Kinoshita",
                  :displayname => "Bruno Kinoshita",
                  :objectclass => "User",
                  :givenname => "Bruno",
                  :sn => 'Kinoshita',
                  :telephoneNumber => "(17)3333-3333",
                  :mail => "brunokino@gmail.com",
                  :l => "Barretos",
                  :st => "SP",
                  :title => "Supervisor de Infraestrutura",
                  :description => "Supervisor de Infraestrutura",
                  :physicaldeliveryofficename => "Bebedouro I",
                  :initials => "BOK",
                  :c => "BR",
                  :department => "Tecnologia da Informação",
                  :company => "Comfrio Stock Tech"
                  
                  
                  
                }
    ldap.add(:dn => dn, :attributes => attr)