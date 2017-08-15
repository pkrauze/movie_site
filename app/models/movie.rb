class Movie < ActiveRecord::Base
    mount_uploader :cover, CoverUploader

    ratyrate_rateable 'visual_effects', 'original_score', 'director', 'custome_design'

    belongs_to :director
    has_many :order_items
    has_many :comments, as: :commentable
    has_many :notifications, :dependent => :destroy
    has_and_belongs_to_many :genres
    
    accepts_nested_attributes_for :genres, :allow_destroy => true
end
