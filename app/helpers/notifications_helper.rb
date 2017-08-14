module NotificationsHelper
    
  def notifications_number
    @subbed = current_user.subscribers
    @subbed_dir = @subbed.pluck(:director_id)
    @notifications = Notification.where(director_id: @subbed_dir, read: false)
    
    if @notifications.size>0
      "You have #{@notifications.size} new notifications"
    else
      "Notifications"
    end
  end
end
