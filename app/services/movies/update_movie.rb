module Movies
    class UpdateMovie
        def initialize(id, params)
            @params = params
            @id = id
        end
        
        def call
            @movie = Movie.find(@id)
            @movie.update(@params)
        end
    end
end