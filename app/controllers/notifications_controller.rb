class NotificationsController < ApplicationController
  before_action :authenticate_user!
<<<<<<< HEAD

=======
  
>>>>>>> a1d9525de1485bad64f54127a47f7dd3ce2fc7e8
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
