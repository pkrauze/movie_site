class SubscribersController < ApplicationController

  def index
    @subscribers = current_user.subscribers.all
  end
  
  def subscribe
    @director = Director.find_by(params[:director_id])
    
    if Subscriptions::Subscribe.new(current_user,@director.id).call
       respond_to do |format|
        format.html { redirect_to directors_path, notice: 'Subscription was successfully created.' }
        format.js
      end
    end
  end
  
  def unsubscribe
    @director = Director.find_by(params[:director_id])
    
    if Subscriptions::Unsubscribe.new(current_user,@director.id).call
       respond_to do |format|
        format.html { redirect_to directors_path, notice: 'Subscription was successfully removed.' }
        format.js
    end
  end
end
end
