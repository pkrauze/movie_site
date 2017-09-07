class Director < ActiveRecord::Base
    before_destroy :remove_image_file
    before_validation :create_slug

    mount_uploaders :images, ImageUploader
    serialize :images, JSON
        
    has_many :movies
    has_many :subscribers
    has_many :notifications
    
    ratyrate_rateable 'director_rating'
    
    validates_presence_of :firstname, :lastname, :year_of_birth

    extend FriendlyId
    friendly_id :slug, use: [:slugged, :finders]
    
    def fullname
      self.firstname + " " + self.lastname
    end

    def slug
      "#{self.firstname}-#{self.lastname}".downcase
    end

    def create_slug
      self.slug = slug
    end
    
    def remove_image_file
      FileUtils.rm_rf("#{Rails.root}/public/uploads/director/images/#{self.id}")
    end
end
