class NotificationsController < ApplicationController
<<<<<<< HEAD
  before_action :authenticate_user!
=======
  before_filter :authenticate_user!
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad
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
