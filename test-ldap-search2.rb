require 'rubygems'
require 'net/ldap'

ldap = Net::LDAP.new :host => "52.37.141.91",
     :port => 389,
     :auth => {
           :method => :simple,
           :username => "cn=svc-ldap,ou=usuarios,dc=intranet,dc=local",
           :password => "NewReq@123"
     }

treebase = "ou=usuarios,dc=intranet,dc=local"

ldap.search( :base => treebase) do |entry|
    puts "DN: #{entry.dn}"
end


if ldap.bind
 print "It works\n"
else
 print "Houston we have a problem\n"
end