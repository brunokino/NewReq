class LdapController < ApplicationController
    before_action :set_newuser, only: [:show, :create]
    before_action :load_attributes, only: [:show, :create]
    
    
    def index
      @newusers = Newuser.all
    end

    
    def show
    end


    def create
    
    
    
    if Newuserldap.where(:newusers_id => @newusers_id).present?
      redirect_to "http://www.comfrio.com.br"
    else
      Newuserldap.create(:cn => @cn) do |u|
        u.dn = @dn
        u.objectclass = @objectclass
        u.name = @name
        u.givenname = @givenname
        u.sn = @sn
        u.cn = @cn
        u.displayname = @displayname
        u.userPrincipalName = @userPrincipalName
        u.sAMAccountName = @sAMAccountName
        u.title = @title
        u.description = @description
        u.company = @company
        u.department = @department
        u.telephoneNumber = @telephoneNumber
        u.facsimileTelephoneNumber = @facsimileTelephoneNumber
        u.homePhone = @homePhone
        u.ipPhone = @ipPhone
        u.mobile = @mobile
        u.physicalDeliveryOfficeName = @physicalDeliveryOfficeName
        u.l = @l
        u.st = @st
        u.streetAddress = @streetAddress
        u.postalCode = @postalCode
        u.postOfficeBox = @postOfficeBox
        u.c = @c
        u.manager = @manager
        u.mail = @mail
        u.proxyAddresses = @proxyAddresses
        u.wWWHomePage = @wWWHomePage
        u.userPassword = @userPassword
        u.newusers_id = @newusers_id
      end        
    end
    

    
    end


  private

    # Use callbacks to share common setup or constraints between actions.
    def set_newuser
      @newuser = Newuser.find(params[:id])
    end


    def load_attributes
      @domain = "intranet.local"
      @pubdomain = "publicdomain.com"
      @ou = ",ou=usuarios,dc=intranet,dc=local"
      @cn = @newuser.firstname + " " + @newuser.lastname
      @userPrincipalName = @newuser.username + "@" + @domain
      @mail = @newuser.username + "@" + @pubdomain
      @dn = "cn=" + @cn + @ou
      @sAMAccountName = @newuser.username
      @name = @cn
      @displayname = @cn
      @objectclass = "User"
      @givenname = @newuser.firstname
      @sn = @newuser.lastname
      @telephoneNumber = @newuser.phone
      @facsimileTelephoneNumber = @telephoneNumber
      @homePhone = @newuser.homephone
      @ipPhone = @newuser.ipphone
      @mobile = @newuser.mobile
      @physicalDeliveryOfficeName = @newuser.Office
      @l = @newuser.City
      @st = @newuser.State
      @title = @newuser.title
      @description = @newuser.description
      @c = @newuser.Country
      @department = @newuser.department
      @company = @newuser.company_id
      @streetAddress = @newuser.address
      @postalCode = @newuser.postalcode
      @postOfficeBox = @newuser.pobox
      @manager = @newuser.grant_id
      @proxyAddresses = "SMTP:" + @mail
      @wWWHomePage = @newuser.website
      @userPassword = "Teste@123*"
      @newusers_id = @newuser.id
    end

    
end
