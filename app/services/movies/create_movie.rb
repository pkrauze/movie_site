module Movies
    class CreateMovie
        def initialize(params)
            @params = params
        end
        
        def call
            movie = Movie.new(@params)
            movie.director.build_director @params[:director_attributes]
            movie.save!
            create_notification
        end
        
        private
        
        def create_notification
          movie_id = Movie.last.id
          Notification.create(director_id: @params[:director_id], movie_id: movie_id, notification_type:"new movie", read: false).save
          
          @genres = @params[:genre_ids]
          @genres.reject(&:blank?).each do |g|
            Notification.create(genre_id: g, movie_id: movie_id, notification_type:"new movie", read: false).save
          end
        end
    end
end