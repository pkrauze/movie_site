module Cart
  class DestroyOrder
    def initialize(order,id)
      @order = order
      @id = id
    end
    
    def call
      @order_item = @order.order_items
      @item = @order_item.find_by(id: @id)
      @item.destroy
      @order_items = @order.order_items
      
      return @order_items
    end
  end
end