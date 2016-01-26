class Company < ActiveRecord::Base
    has_many :sites
    has_many :employees
end
