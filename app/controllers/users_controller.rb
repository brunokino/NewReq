class UsersController < ApplicationController


######################################################
##                                                  ##
## Under development                                ##
##                                                  ##
######################################################



  def index
    @users = User.all
  end

  def show
  
    connect_ldap
    ldap_my_user    
    
    @ldap.search( :base => @treebase, :filter => @filter ) do |entry|
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

