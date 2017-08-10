class OrderItem < ActiveRecord::Base
  belongs_to :movie
  belongs_to :order
  
  validate :movie_present
  validate :order_present
  
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

  def movie_present
    if movie.present?
    end
  end
  
  def order_present
    if order.present?
    end
  end
  
  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = total_price
  end
end
