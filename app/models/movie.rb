class Movie < ActiveRecord::Base
  before_destroy :remove_image_file

  paginates_per 20
      
  mount_uploaders :images, ImageUploader
  mount_uploaders :covers, CoverUploader
  serialize :images, JSON
  serialize :covers, JSON

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  ratyrate_rateable 'rating'

  belongs_to :director
  has_many :order_items, dependent: :destroy
  has_many :comments, as: :commentable
  has_many :notifications, dependent: :destroy
  has_and_belongs_to_many :genres
  
  validates :title, presence: true, uniqueness: true
  validates_presence_of :desc, :year, :time, :director_id, :price
  
  def remove_image_file
    FileUtils.rm_rf("#{Rails.root}/public/uploads/movie/images/#{self.id}")
    FileUtils.rm_rf("#{Rails.root}/public/uploads/movie/covers/#{self.id}")
  end
end
