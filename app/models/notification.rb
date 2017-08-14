class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :director
  belongs_to :movie
end
