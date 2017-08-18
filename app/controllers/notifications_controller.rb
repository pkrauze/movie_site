class NotificationsController < ApplicationController
  before_filter :authenticate_user!
  def index
    find_subscribers
    subbed = current_user.subscribers
    @notifications = []
    @allnotifications = []
    
    if find_comment_notifications.present?
      @notifications = find_comment_notifications.where(read: false)
      @allnotifications = find_comment_notifications.where(read: true)
    end
    
    if subbed.any?
      if find_sub_notifications.present?
        @notifications += find_sub_notifications.where(read: false)
        @allnotifications += find_sub_notifications.where(read: true)
      end
    end
  end
  
  def link_through
    notification = Notification.find(params[:id])
    if notification.update(read: true)
      redirect_to movie_path(notification.movie)
    end
  end
  
  private
  
  def find_subscribers
    @subbed = current_user.subscribers
    if @subbed.any?
      @sub_date = @subbed.last.created_at
      @subbed_dir = @subbed.pluck(:director_id)
      @subbed_genre = @subbed.pluck(:genre_id)
    end
  end
  
  def find_sub_notifications
    dir_notif = Notification.where(director_id: @subbed_dir).where("director_id is not ?",nil)
    genre_notif = Notification.where(genre_id: @subbed_genre).where("genre_id is not ?",nil)
    
    @allnotifications = dir_notif.after_sub(@sub_date) + genre_notif.after_sub(@sub_date)
    
    return @allnotifications
  end
  
  def find_comment_notifications
    return @comments_notification = Notification.where("comment_id is not ?",nil).where("user_id = ?",current_user.id)
  end
end
