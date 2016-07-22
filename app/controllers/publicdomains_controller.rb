class PublicdomainsController < ApplicationController
  before_action :set_publicdomain, only: [:show, :edit, :update, :destroy]

  # GET /publicdomains
  # GET /publicdomains.json
  def index
    @publicdomains = Publicdomain.all
  end

  # GET /publicdomains/1
  # GET /publicdomains/1.json
  def show
  end

  # GET /publicdomains/new
  def new
    @publicdomain = Publicdomain.new
  end

  # GET /publicdomains/1/edit
  def edit
  end

  # POST /publicdomains
  # POST /publicdomains.json
  def create
    @publicdomain = Publicdomain.new(publicdomain_params)

    respond_to do |format|
      if @publicdomain.save
        format.html { redirect_to @publicdomain, notice: 'Publicdomain was successfully created.' }
        format.json { render :show, status: :created, location: @publicdomain }
      else
        format.html { render :new }
        format.json { render json: @publicdomain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publicdomains/1
  # PATCH/PUT /publicdomains/1.json
  def update
    respond_to do |format|
      if @publicdomain.update(publicdomain_params)
        format.html { redirect_to @publicdomain, notice: 'Publicdomain was successfully updated.' }
        format.json { render :show, status: :ok, location: @publicdomain }
      else
        format.html { render :edit }
        format.json { render json: @publicdomain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publicdomains/1
  # DELETE /publicdomains/1.json
  def destroy
    @publicdomain.destroy
    respond_to do |format|
      format.html { redirect_to publicdomains_url, notice: 'Publicdomain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publicdomain
      @publicdomain = Publicdomain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publicdomain_params
      params.require(:publicdomain).permit(:domain)
    end
end
