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
    @current_user ||= super || Guest.new
  end
  
  def user_signed_in?
    current_user.is_a? User
  end
  
end
