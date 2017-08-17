class NotificationsController < ApplicationController
  before_filter :authenticate_user!
  def index
    subbed = current_user.subscribers
    
    if subbed.any?
      find_notifications(subbed)
    end
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
      
      notif = Notification.where(director_id: subbed_dir, read: false)
      allnotif = Notification.where(director_id: subbed_dir)
      
      @notifications = notif.where("created_at > ?",sub_date)
      @allnotifications = allnotif.where("created_at > ?",sub_date)
  end
end
