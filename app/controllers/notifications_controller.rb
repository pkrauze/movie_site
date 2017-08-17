class NotificationsController < ApplicationController
  before_filter :authenticate_user!
  def index
    subbed = current_user.subscribers
    @notifications,@allnotifications = []
    if subbed.any?
      find_notifications(subbed)
    end
    @notifications += find_comment_notifications
    @allnotifications += find_comment_notifications
  end
  
  def link_through
    notification = Notification.find(params[:id])
    if notification.update(read:true)
      redirect_to movie_path(notification.movie)
    end
  end
  
  private
  
  def find_notifications(subbed)
      sub_date = subbed.last.created_at
      subbed_dir = subbed.pluck(:director_id)
      subbed_genre = subbed.pluck(:genre_id)
      
      dir_notif = Notification.where(director_id: subbed_dir, read: false).where("director_id is not ?",nil)
      dir_allnotif = Notification.where(director_id: subbed_dir).where("director_id is not ?",nil)
      
      genre_notif = Notification.where(genre_id: subbed_genre, read: false).where("genre_id is not ?",nil)
      genre_allnotif = Notification.where(genre_id: subbed_genre).where("genre_id is not ?",nil)
      
      @notifications = dir_notif.after_sub(sub_date) + genre_notif.after_sub(sub_date)
      @allnotifications = dir_allnotif.after_sub(sub_date) + genre_allnotif.after_sub(sub_date)
  end
  
  def find_comment_notifications
    return @comments_notification = Notification.where("comment_id is not ?",nil).where(read: false)
  end
end
