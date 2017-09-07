class SubscribersController < ApplicationController
  before_action :set_director,:set_genre, only: [:subscribe, :unsubscribe]
  before_action :authenticate_user!

  def index
    @subscribers = current_user.subscribers
    @subscribed_directors = @subscribers.where("director_id is not ?",nil)
    @subscribed_genres = @subscribers.where("genre_id is not ?",nil)
  end
  
  def subscribe
    if params[:director_id]
      if Subscriptions::SubscribeDirector.new(current_user,@director.id).call
        redirect_to :back
      end
    elsif params[:genre_id]
      if Subscriptions::SubscribeGenre.new(current_user,@genre.id).call
        redirect_to :back
      end
    end
  end
  
  def unsubscribe
    if params[:director_id]
      if Subscriptions::UnsubscribeDirector.new(current_user,@director.id).call
        redirect_to :back
      end
    elsif params[:genre_id]
      if Subscriptions::UnsubscribeGenre.new(current_user,@genre.id).call
        redirect_to :back
      end
    end
  end
  
  private
  
  def set_director
    @director = Director.find_by(id: params[:director_id])
  end
  
  def set_genre
    @genre = Genre.find_by(id: params[:genre_id])
  end
end
