class NotificationsController < ApplicationController
  
  def index
    @subbed = current_user.subscribers
    @subbed_dir = @subbed.pluck(:director_id)
    @notifications = Notification.where(director_id: @subbed_dir, read: false)
    @allnotifications = Notification.where(director_id: @subbed_dir)
  end
  
  def link_through
    @notification = Notification.find(params[:id])
    if @notification.update(read:true)
      redirect_to movie_path(@notification.movie)
    end
  end
end
