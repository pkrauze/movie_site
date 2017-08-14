class Director < ActiveRecord::Base
    has_many :movies
    has_many :subscribers
end
