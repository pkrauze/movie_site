module Cart
  class CreateOrder
    def initialize(order,order_item_params)
      @order_item_params = order_item_params
      @order = order
    end
    
    def call
      update_total
      set_order_status
      @order_item = @order.order_items.new(@order_item_params)
      @order.save
      
      return @order.id
    end
    
    private
    
    def set_order_status
      @order.order_status_id = 1
    end
    
    def update_total
      @order[:total] = @order.total
    end
    
  end
end