module Movies
    class DeleteMovie
        def initialize(id)
            @id = id
        end
        
        def call
            @movie = Movie.find(@id)
            @movie.destroy
        end
    end
end