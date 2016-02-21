class LdapController < ApplicationController
    before_action :set_newuser, only: [:show]
    
    def show
      @fullname = @newuser.username + "@intranet.local"
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
