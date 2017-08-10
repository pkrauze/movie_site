module Movies
    class CreateMovie
        def initialize(params)
            @params = params
        end
        
        def call
            Movie.new(@params).save
        end
    end
end