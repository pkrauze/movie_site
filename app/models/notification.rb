class Notification < ActiveRecord::Base
  scope :after_sub, -> (sub_date) { where("created_at > ?",sub_date) }
  scope :unread, -> { where(read: false) }
  
  belongs_to :user
  belongs_to :director
  belongs_to :movie
  belongs_to :genre
  belongs_to :comment
  
  validates_presence_of :notification_type, :read

end
