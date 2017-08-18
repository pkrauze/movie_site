module NotificationsHelper
    def notifications_number
      subbed = current_user.subscribers
     
      notifications = []
      comments_notification = Notification.where("comment_id is not ?",nil).where("user_id = ?",current_user.id).where(read: false)
      if subbed.any?
        sub_date = subbed.last.created_at
        subbed_dir = subbed.pluck(:director_id)
        subbed_genre = subbed.pluck(:genre_id)
        
        dir_notif = Notification.where(director_id: subbed_dir, read: false).where("director_id is not ?",nil)
        genre_notif = Notification.where(genre_id: subbed_genre, read: false).where("genre_id is not ?",nil)
        
        
        notifications = dir_notif.after_sub(sub_date) + genre_notif.after_sub(sub_date)
      else
        "Notifications"
      end
      
      notifications += comments_notification        
      if notifications.size>0
        "You have #{notifications.size} new notifications"
      else
        "Notifications"
      end
      
    end
end
