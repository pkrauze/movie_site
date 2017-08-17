class SubscribersController < ApplicationController

  def index
    @subscribers = current_user.subscribers
    @subscribed_directors = @subscribers.where("director_id is not ?",nil)
    @subscribed_genres = @subscribers.where("genre_id is not ?",nil)
  end
  
  def subscribe
    if params[:director_id]
      @director = Director.find_by(id: params[:director_id])
      
      if Subscriptions::SubscribeDirector.new(current_user,@director.id).call
        redirect_to directors_path, notice: 'Subscription was successfully created.'
      end
    elsif params[:genre_id]
      @genre = Genre.find_by(id: params[:genre_id])
      
      if Subscriptions::SubscribeGenre.new(current_user,@genre.id).call
        redirect_to genres_path, notice: 'Subscription was successfully deleted.'
      end
    end
  end
  
  def unsubscribe
    if params[:director_id]
      @director = Director.find_by(id: params[:director_id])
      
      if Subscriptions::UnsubscribeDirector.new(current_user,@director.id).call
        redirect_to directors_path, notice: 'Subscription was successfully created.'
      end
    elsif params[:genre_id]
      @genre = Genre.find_by(id: params[:genre_id])
      
      if Subscriptions::UnsubscribeGenre.new(current_user,@genre.id).call
        redirect_to genres_path, notice: 'Subscription was successfully deleted.'
      end
    end
  end
end
