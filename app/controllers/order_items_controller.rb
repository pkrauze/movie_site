class OrderItemsController < ApplicationController
  before_action :set_current_order
  
  def create
    session[:order_id] = Cart::CreateOrder.new(@order,order_item_params).call
  end

  def update
    @order_items = Cart::UpdateOrder.new(@order,params[:id]).call
  end

  def destroy
    @order_items = Cart::DestroyOrder.new(@order,params[:id]).call
  end

private
  def set_current_order
    @order = current_order
  end
  
  def order_item_params
    params.require(:order_item).permit(:movie_id)
  end
end
