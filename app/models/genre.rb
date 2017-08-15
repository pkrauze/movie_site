class Genre < ActiveRecord::Base
  has_and_belongs_to_many :movies
  
  accepts_nested_attributes_for :movies, :reject_if => lambda { |a| a[:input_id].blank? },  :allow_destroy => true
end
