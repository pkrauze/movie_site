class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :director
  belongs_to :movie

  #validates_presence_of :movie_id, :director_id
end
