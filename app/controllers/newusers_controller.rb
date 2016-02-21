class NewusersController < ApplicationController
  before_action :set_newuser, only: [:show, :edit, :update, :destroy]

  # GET /newusers
  # GET /newusers.json
  def index
    @newusers = Newuser.all
  end

  # GET /newusers/1
  # GET /newusers/1.json
  def show
  end

  # GET /newusers/new
  def new
    @newuser = Newuser.new
    
    @grants = Grant.all
    @companies = Company.all
    @sites = Site.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employee }
    end
    
  end

  # GET /newusers/1/edit
  def edit
    
    @grants = Grant.all
    @companies = Company.all
    @sites = Site.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employee }
    end
    
  end

  # POST /newusers
  # POST /newusers.json
  def create
    @newuser = Newuser.new(newuser_params)

    respond_to do |format|
      if @newuser.save
        format.html { redirect_to @newuser, notice: 'Newuser was successfully created.' }
        format.json { render :show, status: :created, location: @newuser }
      else
        format.html { render :new }
        format.json { render json: @newuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newusers/1
  # PATCH/PUT /newusers/1.json
  def update
    respond_to do |format|
      if @newuser.update(newuser_params)
        format.html { redirect_to @newuser, notice: 'Newuser was successfully updated.' }
        format.json { render :show, status: :ok, location: @newuser }
      else
        format.html { render :edit }
        format.json { render json: @newuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newusers/1
  # DELETE /newusers/1.json
  def destroy
    @newuser.destroy
    respond_to do |format|
      format.html { redirect_to newusers_url, notice: 'Newuser was successfully destroyed.' }
      format.json { head :no_content }
    end
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
end
