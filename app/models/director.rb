class Director < ActiveRecord::Base
    has_many :movies
    has_many :subscribers
    has_many :notifications
    
    def fullname
      self.firstname + " " + self.lastname
    end
end
