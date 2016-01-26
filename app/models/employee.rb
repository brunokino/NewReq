class Employee < ActiveRecord::Base
    belongs_to :login
    belongs_to :company
    belongs_to :site
end
