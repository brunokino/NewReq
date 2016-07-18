class ApplicationController < ActionController::Base
  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
###########################################################################################
##                                                                                       ##
## Pending tasks:                                                                        ##
## 1 - Build Mixed authentication as the text box below                                  ##
## 2 - Enable and disable features according to the role / grants the authenticated user ##
## 3 - Build Approval Workflow                                                           ##
###########################################################################################


  ##################################################################
  ## Kinoshita: Enabling Device LDAP. Next step is to create a    ##
  ## mixed authentication, Local and LDAP to authenticate as an   ##
  ## administrator in the case of losing the LDAP server or       ##
  ## doing wrong settings                                         ##
  ##################################################################
  
  
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_in) << :username
  end
  

  def connect_ldap
    require 'rubygems'
    require 'net/ldap'

    @ldap = Net::LDAP.new  :host => "52.42.36.221",
                          :port => 389,
                          :auth => {
                                    :method => :simple,
                                    :username => "cn=svc-ldap,ou=usuarios,dc=intranet,dc=local",
                                    :password => "NewReq@123"
                                    }
  end
  
  
  def ldap_all_users
    @filter = Net::LDAP::Filter.eq( "sAMAccountName", "*" )
    @treebase = "ou=usuarios,dc=intranet,dc=local"
  end
  
  
  def ldap_my_user
    @filter = Net::LDAP::Filter.eq( "sAMAccountName", current_user.username )
    @treebase = "dc=intranet,dc=local"  
  
  end
  
end
