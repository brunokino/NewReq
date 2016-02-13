class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  
    require 'rubygems'
    require 'net/ldap'

    ldap = Net::LDAP.new  :host => "130.211.138.238",
                          :port => 389,
                          :auth =>  {
                                    :method => :simple,
                                    :username => "cn=svc-ldap,ou=usuarios,dc=intranet,dc=local",
                                    :password => "NewReq@123"
                                    }

    filter = Net::LDAP::Filter.eq( "sAMAccountName", current_user.username )
    treebase = "dc=intranet,dc=local"

    ldap.search( :base => treebase, :filter => filter ) do |entry|
      @dn = "#{entry.dn}"
      puts "DN: #{entry.dn}"
      entry.each do |attribute, values|
        puts "   #{attribute}:"
        values.each do |value|
          puts "      --->#{value}"
        end
      end
    end


  end


end

