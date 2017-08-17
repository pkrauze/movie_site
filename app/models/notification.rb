class Notification < ActiveRecord::Base
  scope :after_sub, -> (sub_date) { where("created_at > ?",sub_date) }
  
  belongs_to :user
  belongs_to :director
  belongs_to :movie
  belongs_to :genre

  #validates_presence_of :movie_id, :director_id

end
