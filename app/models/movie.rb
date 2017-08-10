class Movie < ActiveRecord::Base
    
    mount_uploader :cover, CoverUploader
    

    belongs_to :director
    has_many :order_items
    has_many :comments, as: :commentable
end
