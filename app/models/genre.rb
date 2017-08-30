class Genre < ActiveRecord::Base
  has_and_belongs_to_many :movies
  has_many :subscribers
  has_many :notifications
  
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  
  validates :name, presence: true, uniqueness: true
end
