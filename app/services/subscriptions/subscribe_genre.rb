module Subscriptions
  class SubscribeGenre
    def initialize(user, genre_id)
      @genre_id = genre_id
      @current_user = user
    end
    
    def call
      subscribe
    end
    
    private
    
    def subscribe
      @current_user.subscribers.create(user_id: @current_user.id, genre_id: @genre_id).save
    end
  end
end