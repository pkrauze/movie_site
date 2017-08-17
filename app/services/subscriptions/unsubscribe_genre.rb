module Subscriptions
  class UnsubscribeGenre
    def initialize(user, genre_id)
      @genre_id = genre_id
      @current_user = user
    end
    
    def call
      unsubscribe
    end
    
    private
    
    def unsubscribe
      @current_user.subscribers.find_by(user_id: @current_user.id, genre_id: @genre_id).destroy
    end
  end
end