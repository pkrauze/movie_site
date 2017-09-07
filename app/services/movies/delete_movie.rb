module Movies
    class DeleteMovie
        def initialize(id)
            @id = id
        end
        
        def call
            Movie.friendly.find(@id).destroy
        end
    end
end