class Company < ActiveRecord::Base
    has_many :sites
    has_many :newusers
end
