module Movies
    class CreateMovie
        def initialize(params)
            @params = params
        end
        
        def call
            Movie.new(@params).save
            create_notification
        end
        
        private
        
        def create_notification
          movie_id = Movie.last.id
          Notification.create(director_id: @params[:director_id], movie_id: movie_id, notification_type:"new movie", read: false).save
        end
    end
end