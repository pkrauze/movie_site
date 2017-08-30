class Director < ActiveRecord::Base
    has_many :movies
    has_many :subscribers
    has_many :notifications
    
    validates_presence_of :firstname, :lastname, :year_of_birth
    
    def fullname
      self.firstname + " " + self.lastname
    end
end
