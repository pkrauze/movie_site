class Genre < ActiveRecord::Base
  has_and_belongs_to_many :movies
  has_many :subscribers
  has_many :notifications
  
  validates :name, presence: true, uniqueness: true
end
