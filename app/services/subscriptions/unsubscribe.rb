module Subscriptions
  class Unsubscribe
    def initialize(user, director_id)
      @director_id = director_id
      @current_user = user
    end
    
    def call
      unsubscribe
    end
    
    private
    
    def unsubscribe
      @current_user.subscribers.find_by(user_id: @current_user.id, director_id: @director_id).destroy
    end
  end
end