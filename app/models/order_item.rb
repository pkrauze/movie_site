class OrderItem < ActiveRecord::Base
  belongs_to :movie
  belongs_to :order
  
  before_save :finalize
  
  def unit_price
    if persisted?
      self[:unit_price]
    else 
      movie.price
    end
  end
  
  def total_price
    unit_price
  end
  
private

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = total_price
  end
end
