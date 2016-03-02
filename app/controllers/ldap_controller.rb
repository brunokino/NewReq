class LdapController < ApplicationController
    before_action :set_newuser, only: [:show]
    before_action :load_attributes, only: [:show]
    
    
    def index
      @newusers = Newuser.all
    end

    
    def show
    end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newuser
      @newuser = Newuser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newuser_params
      params.require(:newuser).permit(:firstname, :lastname, :username, :title, :description, :company_id, :site_id, :department, :grant_id, :phone, :mobile, :homephone, :ipphone, :pager, :Office, :City, :address, :State, :Country, :postalcode, :pobox, :website)
    end

    def load_attributes
      @domain = "intranet.local"
      @ou = ",ou=usuarios,dc=intranet,dc=local"
      @cn = @newuser.firstname + " " + @newuser.lastname
      @userPrincipalName = @newuser.username + "@" + @domain
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
      @physicaldeliveryofficename = @newuser.Office
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
      @proxyAddresses = "SMTP:"
      @wWWHomePage = @newuser.website
      @userPassword = "Teste@123*"
    end

    
end
