class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, :rememberable, :trackable
  
  validates :username, presence: true, uniqueness: true
  


    # hack for remember_token
    def authenticatable_token
      Digest::SHA1.hexdigest(email)[0,29]
    end
  
end
