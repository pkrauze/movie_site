module NotificationsHelper
    def notifications_number
      subbed = current_user.subscribers
     
      notifications = []
      comments_notification = Notification.where("comment_id is not ? AND user_id =?",nil,current_user.id).unread
      
      if subbed.any?
        sub_date = subbed.last.created_at
        subbed_dir = subbed.pluck(:director_id).compact
        subbed_genre = subbed.pluck(:genre_id).compact
        
        dir_notif = Notification.where(director_id: subbed_dir).unread
        genre_notif = Notification.where(genre_id: subbed_genre).unread
        
        notifications = dir_notif.after_sub(sub_date) + genre_notif.after_sub(sub_date)
      end
      
      notifications += comments_notification        
      if notifications.size>0
        return notifications.size
      end
    end
end
