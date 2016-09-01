class LdapserversController < ApplicationController
  before_action :set_ldapserver, only: [:show, :edit, :update, :destroy]

  # GET /ldapservers
  # GET /ldapservers.json
  def index
    @ldapservers = Ldapserver.all
  end

  # GET /ldapservers/1
  # GET /ldapservers/1.json
  def show
    
    require 'net/ldap'
    ldap = Net::LDAP.new(:host => @ldapserver.host, :port => @ldapserver.port)
    if ldap.bind( :method => :simple, 
                  :username => @ldapserver.username,
                  :password => @ldapserver.password,
                  :connect_timeout => 3)
                  # authentication succeeded
                  @ldaptest = 1
                  @message = ldap.get_operation_result.message
    else
      # authentication failed
      @ldaptest = 0
      @message = ldap.get_operation_result.message
    end

    
  end

  # GET /ldapservers/new
  def new
    @ldapserver = Ldapserver.new
  end

  # GET /ldapservers/1/edit
  def edit
  end

  # POST /ldapservers
  # POST /ldapservers.json
  def create
    @ldapserver = Ldapserver.new(ldapserver_params)

    respond_to do |format|
      if @ldapserver.save
        format.html { redirect_to @ldapserver, notice: 'Ldapserver was successfully created.' }
        format.json { render :show, status: :created, location: @ldapserver }
      else
        format.html { render :new }
        format.json { render json: @ldapserver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ldapservers/1
  # PATCH/PUT /ldapservers/1.json
  def update
    respond_to do |format|
      if @ldapserver.update(ldapserver_params)
        format.html { redirect_to @ldapserver, notice: 'Ldapserver was successfully updated.' }
        format.json { render :show, status: :ok, location: @ldapserver }
      else
        format.html { render :edit }
        format.json { render json: @ldapserver.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  # DELETE /ldapservers/1
  # DELETE /ldapservers/1.json
  def destroy
    @ldapserver.destroy
    respond_to do |format|
      format.html { redirect_to ldapservers_url, notice: 'Ldapserver was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ldapserver
      @ldapserver = Ldapserver.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ldapserver_params
      params.require(:ldapserver).permit(:domain, :host, :port, :attributename, :base, :username, :password, :method, :description)
    end
end
