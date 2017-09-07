class Subscriber < ActiveRecord::Base
  belongs_to :user
  belongs_to :director
  belongs_to :genre
  
  validates_presence_of :user_id
end
