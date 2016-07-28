require 'rubygems'
require 'net/ldap'

ldap = Net::LDAP.new :host => "52.43.44.152",
     :port => 389,
     :auth => {
           :method => :simple,
           :username => "CN=Service for LDAP Connection,CN=Users,DC=intranet,DC=local",
           :password => "NewReq@123"
     }

filter = Net::LDAP::Filter.eq( "sAMAccountName", "*" )
treebase = "CN=Users,DC=intranet,DC=local"

ldap.search( :base => treebase, :filter => filter ) do |entry|
  puts "DN: #{entry.dn}"
  entry.each do |attribute, values|
     puts "   #{attribute}:"
     values.each do |value|
       puts "      --->#{value}"
     end
   end
end

# p ldap.get_operation_result

if ldap.bind
 print "It works\n"
else
 print "Houston we have a problem\n"
end