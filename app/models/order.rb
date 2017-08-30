class Order < ActiveRecord::Base
  belongs_to :order_status
  has_many :order_items

  def total
    order_items.collect { |oi| oi.valid? ? (oi.unit_price) : 0 }.sum
  end
end
