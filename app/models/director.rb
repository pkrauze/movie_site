class Director < ActiveRecord::Base
    before_destroy :remove_image_file

    mount_uploaders :images, ImageUploader
    serialize :images, JSON
        
    has_many :movies
    has_many :subscribers
    has_many :notifications
    
    ratyrate_rateable 'director_rating'
    
    validates_presence_of :firstname, :lastname, :year_of_birth
    
    def fullname
      self.firstname + " " + self.lastname
    end
    
    def remove_image_file
      FileUtils.rm_rf("#{Rails.root}/public/uploads/director/images/#{self.id}")
    end
end
