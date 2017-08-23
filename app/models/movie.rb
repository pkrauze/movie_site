class Movie < ActiveRecord::Base
    mount_uploaders :images, ImageUploader
    extend FriendlyId
    friendly_id :title, use: [:slugged, :finders]

    ratyrate_rateable 'visual_effects', 'original_score', 'director', 'custome_design'

    belongs_to :director
    has_many :order_items, dependent: :destroy
    has_many :comments, as: :commentable
    has_many :notifications, dependent: :destroy
    has_and_belongs_to_many :genres
end
