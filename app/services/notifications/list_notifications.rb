module Notifications
  class ListNotifications
    def initialize(user)
      @current_user = user
    end
    
    def call
      find_subscribers
      find_sub_notifications
      @notifications = []
      @allnotifications = []
      
      if find_comment_notifications.present?
        @notifications = find_comment_notifications.where(read: false)
        @allnotifications = find_comment_notifications.where(read: true)
      end
      
      if subbed.any?
        if @sub_new_notifications.present? || @sub_all_notifications.present?
          @notifications += @sub_new_notifications
          @allnotifications += @sub_all_notifications
        end
      end
      
      return [@notifications, @allnotifications]
    end
    
    private
    
    def find_subscribers
      if subbed.any?
        @subdate = subbed.last.created_at
        @subbed_dir = subbed.pluck(:director_id).compact
        @subbed_genre = subbed.pluck(:genre_id).compact
      end
    end
    
    def find_sub_notifications
      read_dir_notif = Notification.where(director_id: @subbed_dir).after_sub(@subdate)
      read_genre_notif = Notification.where(genre_id: @subbed_genre).after_sub(@subdate)
      
      unread_dir_notif = Notification.where(director_id: @subbed_dir).after_sub(@subdate).unread
      unread_genre_notif = Notification.where(genre_id: @subbed_genre).after_sub(@subdate).unread

      @sub_new_notifications = unread_dir_notif + unread_genre_notif
      @sub_all_notifications = read_dir_notif + read_genre_notif
    end
    
    def find_comment_notifications
      Notification.where("comment_id is not ?",nil).where("user_id = ?",@current_user.id)
    end
    
    def subbed
      @current_user.subscribers
    end
  end
end