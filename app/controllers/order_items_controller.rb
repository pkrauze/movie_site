class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  
  def create
    session[:order_id] = Cart::CreateOrder.new(current_order,order_item_params).call
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

  def update
    @order_items = Cart::UpdateOrder.new(current_order,params[:id]).call
  end

  def destroy
    @order_items = Cart::DestroyOrder.new(current_order,params[:id]).call
  end

private
  def order_item_params
    params.require(:order_item).permit(:movie_id)
  end
end
