class NotificationsController < ApplicationController
  
  def index
    @subbed = current_user.subscribers
    @subbed_dir = @subbed.pluck(:director_id)
    @notifications = Notification.where(director_id: @subbed_dir)
  end
  
end
