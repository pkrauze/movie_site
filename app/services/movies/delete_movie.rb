module Movies
    class DeleteMovie
        def initialize(id)
            @id = id
        end
        
        def call
            Movie.find(@id).destroy
        end
    end
end