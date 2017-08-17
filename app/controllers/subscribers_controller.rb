class SubscribersController < ApplicationController

  def index
    @subscribers = current_user.subscribers.all
  end
  
  def subscribe
    @director = Director.find_by(id: params[:director_id])
    
    if Subscriptions::Subscribe.new(current_user,@director.id).call
      redirect_to directors_path, notice: 'Subscription was successfully created.'
    end
  end
  
  def unsubscribe
    @director = Director.find_by(id: params[:director_id])
    
    if Subscriptions::Unsubscribe.new(current_user,@director.id).call
      redirect_to directors_path, notice: 'Subscription was successfully removed.'
    end
  end

end
