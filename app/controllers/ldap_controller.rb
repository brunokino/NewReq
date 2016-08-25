class LdapController < ApplicationController
    before_action :set_newuser, only: [:show, :create, :overwrite, :build]
    before_action :set_newuserldap, only: [:show, :build, :destroy, :overwrite, :edit]
    before_action :load_attributes, only: [:create]
    
    def index
      @newuserldap = Newuserldap.all
    end
    
    # GET /ldap/1/edit
    def edit
      @newuserldap = Newuserldap.where(newusers_id: params[:id]).first
    end


    def show
      connect_ldap(@ldapserver.id)
      ldap_all_users
      
      @check_dn = 0
      @check_cn = 0
      @check_userPrincipalName = 0
      @check_mail = 0
        
      @ldap.search( :base => @treebase, :filter => @filter ) do |entry2| 
        if @newuserldap.dn == entry2.dn
          @check_dn = @check_dn + 1
        end
        if @newuserldap.cn == entry2.cn[0]
          @check_cn = @check_cn + 1
        end
        if @newuserldap.userPrincipalName == entry2.userPrincipalName[0]
           @check_userPrincipalName = @check_userPrincipalName + 1
        end
        #if @newuserldap.mail == entry2.mail[0]
        #   @check_mail = @check_mail + 1
        #end

      end 
      
      
    end




    def create
      if Newuserldap.where(:newusers_id => @newusers_id).present?
        redirect_to action: "show", id: @newuser.id
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
        redirect_to action: "show", id: @newuser.id
      end
    end
    
    

    def build
      connect_ldap(@ldapserver.id)
      dn = @newuserldap.dn
                attr = {
                  :cn => @newuserldap.cn,
                  :userPrincipalName => @newuserldap.userPrincipalName,
                  :sAMAccountName => @newuserldap.sAMAccountName,
                  :name => @newuserldap.name,
                  :displayname => @newuserldap.displayname,
                  :objectclass => @newuserldap.objectclass,
                  :givenname => @newuserldap.givenname,
                  :sn => @newuserldap.sn,
                  :telephoneNumber => @newuserldap.telephoneNumber,
                  :facsimileTelephoneNumber => @newuserldap.facsimileTelephoneNumber,
                  :homePhone => @newuserldap.homePhone,
                  :ipPhone => @newuserldap.ipPhone,
                  :mobile => @newuserldap.mobile,
                  :mail => @newuserldap.mail,
                  :l => @newuserldap.l,
                  :st => @newuserldap.st,
                  :title => @newuserldap.title,
                  :description => @newuserldap.description,
                  :physicaldeliveryofficename => @newuserldap.physicalDeliveryOfficeName,
                  :c => @newuserldap.c,
                  :department => @newuserldap.department,
                  :company => @newuserldap.company,
                  :streetAddress => @newuserldap.streetAddress,
                  :postalCode => @newuserldap.postalCode,
                  :postOfficeBox => @newuserldap.postOfficeBox,
                  :manager => @newuserldap.manager,
                  :proxyAddresses => @newuserldap.proxyAddresses,
                  :wWWHomePage => @newuserldap.wWWHomePage,
                  :userPassword => @newuserldap.userPassword
                }.reject { |key,value| value.empty? }
      @ldap.add(:dn => dn, :attributes => attr)
    end




    def update
      @newuserldap = Newuserldap.where(newusers_id: params[:id]).first
      respond_to do |format|
        if @newuserldap.update(ldap_params)
          #format.html { redirect_to @newuserldap, notice: 'Grant was successfully updated.' }
          format.html { redirect_to action: 'show', id: params[:id]}
          format.json { render :show, status: :ok, location: @newuserldap }
        else
          format.html { render :edit }
        format.json { render json: @newuserldap.errors, status: :unprocessable_entity }
        end
      end
    end




    def overwrite
      @newuserldap.destroy
      redirect_to newusers_path
    end


    def destroy
      @newuserldap.destroy
      redirect_to ldap_index_path, notice: 'Attributes was successfully destroyed.'
    end



private

    #######################################
    # Loading user by ID on Newuser table #
    #######################################
    
    def set_newuser
      @newuser = Newuser.find(params[:id])
      @publicdomain = Publicdomain.find(@newuser.publicdomain_id)
      @ldapserver = Ldapserver.find(@newuser.ldapserver_id)
    end

    #####################################################
    # Loading user by newusers_id on Newuserldap table  #
    #####################################################
    
    def set_newuserldap
      @newuserldap = Newuserldap.where(newusers_id: params[:id]).first
    end

    ###############################################################################################
    ## Kinoshita: Preparing the LDAP attribute variables using the data table "newusers"         ##
    ## Next step will be to bring the variables "Domain", "Public Domain", "Organizational Unit" ##
    ## and other information through the database                                                ##
    ###############################################################################################
    
    
    def load_attributes
      @domain = @ldapserver.domain        # You need to bring from database
      @pubdomain = @publicdomain.domain   # You need to create a registration screen for public domain
      @ou = ",OU=NewReq,DC=intranet,DC=local" #You need to create a registration screen for Organizational Units
      @cn = @newuser.firstname + " " + @newuser.lastname
      @userPrincipalName = @newuser.username + "@" + @domain
      @mail = @newuser.username + "@" + @pubdomain
      @dn = "CN=" + @cn + @ou
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
      @physicalDeliveryOfficeName = @newuser.site.name
      @l = @newuser.site.city
      @st = @newuser.site.state
      @title = @newuser.title
      @description = @newuser.description
      @c = @newuser.site.country
      @department = @newuser.department
      @company = @newuser.company.name
      @streetAddress = @newuser.address
      @postalCode = @newuser.postalcode
      @postOfficeBox = @newuser.pobox
      @manager = @newuser.grant.cn
      @proxyAddresses = "SMTP:" + @mail
      @wWWHomePage = @newuser.website
      @userPassword = "Teste@123*" # You need to build a random password generator and learn how to put the user in LDAP as "Enabled"
      @newusers_id = @newuser.id
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def ldap_params
      params.require(:newuserldap).permit(:dn, :cn, :userPrincipalName, :mail, :sAMAccountName, :name, :displayname, :givenname, :sn, :telephoneNumber, :facsimileTelephoneNumber, :homePhone, :ipPhone, :mobile, :l, :st, :title, :description, :c, :department, :company, :streetAddress, :postalCode, :postOfficeBox, :manager, :proxyAddresses, :wWWHomePage, :userPassword)
    end
    
end
