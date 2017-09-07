class Genre < ActiveRecord::Base
  before_destroy :remove_image_file
  
  has_and_belongs_to_many :movies
  has_many :subscribers
  has_many :notifications
  
  mount_uploaders :images, ImageUploader
  serialize :images, JSON
    
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  
  validates :name, presence: true, uniqueness: true
  
  def remove_image_file
    FileUtils.rm_rf("#{Rails.root}/public/uploads/genre/images/#{self.id}")
  end
end
