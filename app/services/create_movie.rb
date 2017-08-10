class CreateMovie

    def initialize(params)
        @params = params
    end
    
    def save
        Movie.new(@params).save
    end
end