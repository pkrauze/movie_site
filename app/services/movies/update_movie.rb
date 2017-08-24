module Movies
    class UpdateMovie
        def initialize(id, params)
            @params = params
            @id = id
        end
        
        def call
            Movie.friendly.find(@id).update(@params)
        end
    end
end