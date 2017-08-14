class Subscribed < ActiveRecord::Base
  belongs_to :user
  belongs_to :director
end
