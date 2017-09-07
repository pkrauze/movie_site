module Cart
  class UpdateOrder
    def initialize(order,id)
      @order = order
      @id = id
    end
    
    def call
      update_total
      @order_item = @order.order_items
      @item = @order_item.find_by(id: @id)
      @item.update_attributes(@order_item_params)
      @order_items = @order.order_items
      
      return @order_items
    end
    
    private
      def update_total
        @order[:total] = @order.total
      end
  end
end