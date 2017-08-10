class CreateMovie

    def initialize(params)
        @params = params
    end
    
    def save
        @movie = Movie.new(@params)
        
        if @movie.save
            true
        else
            false
        end
    end
end