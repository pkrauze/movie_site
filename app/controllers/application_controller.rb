class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order
 # before_action :authenticate_user!
  
  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
  
  def current_user 
    if devise_controller? 
      @current_user = super 
    else 
      @current_user ||= super || Guest.new     
    end 
  end
  
end
