require 'rubygems'
require 'net/ldap'

ldap = Net::LDAP.new :host => "104.199.128.84",
     :port => 389,
     :auth => {
           :method => :simple,
           :username => "cn=teste,ou=usuarios,dc=intranet,dc=local",
           :password => "rails@BR001"
     }

filter = Net::LDAP::Filter.eq( "cn", "Maisa*" )
treebase = "dc=intranet,dc=local"

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