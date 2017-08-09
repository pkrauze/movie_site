class Movie < ActiveRecord::Base
    
    mount_uploader :cover, CoverUploader
    

    belongs_to :director
end
