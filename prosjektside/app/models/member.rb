class Member < ActiveRecord::Base
    validates :name, :presence => true
    validates :age, :presence => true
end
