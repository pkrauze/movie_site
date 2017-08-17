module NotificationsHelper
    def notifications_number
      subbed = current_user.subscribers
      
      if subbed.any?
        sub_date = subbed.last.created_at
        subbed_dir = subbed.pluck(:director_id)
        subbed_genre = subbed.pluck(:genre_id)
        
        dir_notif = Notification.where(director_id: subbed_dir, read: false).where("director_id is not ?",nil)
        genre_notif = Notification.where(genre_id: subbed_genre, read: false).where("genre_id is not ?",nil)

        notifications = dir_notif.after_sub(sub_date) + genre_notif.after_sub(sub_date)
        
        if notifications.size>0
          "You have #{notifications.size} new notifications"
        else
          "Notifications"
        end
      else
        "Notifications"
      end
    end
end
