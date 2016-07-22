class Newuser < ActiveRecord::Base
    belongs_to :grant
    belongs_to :company
    belongs_to :site
    belongs_to :publicdomain
    belongs_to :ldapserver
end
