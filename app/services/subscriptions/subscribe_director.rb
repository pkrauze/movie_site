module Subscriptions
  class SubscribeDirector
    def initialize(user, director_id)
      @director_id = director_id
      @current_user = user
    end
    
    def call
      subscribe
    end
    
    private
    
    def subscribe
      @current_user.subscribers.create(user_id: @current_user.id, director_id: @director_id).save
    end
  end
end