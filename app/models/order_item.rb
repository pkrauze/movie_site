class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  
  validate :product_present
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

  def product_present
    if product.nil?
      flash[:error] = "Product is not valid or active"
    end
  end
  
  def order_present
    if order.nil?
      flash[:error] = "Order is not valid"
    end
  end
  
  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = total_price
  end
end
