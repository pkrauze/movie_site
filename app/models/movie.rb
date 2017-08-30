class Movie < ActiveRecord::Base
  before_destroy :remove_image_file
    
  mount_uploaders :images, ImageUploader
  mount_uploaders :covers, CoverUploader
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  ratyrate_rateable 'rating'

  belongs_to :director
  has_many :order_items, dependent: :destroy
  has_many :comments, as: :commentable
  has_many :notifications, dependent: :destroy
  has_and_belongs_to_many :genres
  
  validates :title, presence: true, uniqueness: true
  validates_presence_of :desc, :year, :time, :director_id, :price, :images, :covers
  validate :require_at_least_one_genre

  def remove_image_file
    FileUtils.rm_rf("#{Rails.root}/public/uploads/movie/images/#{self.id}")
    FileUtils.rm_rf("#{Rails.root}/public/uploads/movie/covers/#{self.id}")
  end
  
  def require_at_least_one_genre
    if genres.count == 0
      errors.add_to_base "Please select at least one genre"
    end
  end
end
