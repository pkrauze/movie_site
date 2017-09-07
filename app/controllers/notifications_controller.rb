class NotificationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @notifications,@allnotifications = Notifications::ListNotifications.new(current_user).call
  end
  
  def link_through
    notification = Notification.find(params[:id])
    if notification.update(read: true)
      redirect_to movie_path(notification.movie)
    end
  end

end
