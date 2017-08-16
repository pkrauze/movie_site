module NotificationsHelper
    
  def notifications_number
    if user_signed_in?
      subbed = current_user.subscribers
      sub_date = subbed.last.created_at
      subbed_dir = subbed.pluck(:director_id)
      notif = Notification.where(director_id: subbed_dir, read: false)
      notifications = notif.where("created_at > ?",sub_date)
      
      if notifications.size>0
        "You have #{notifications.size} new notifications"
      else
        "Notifications"
      end
    end
  end
end
