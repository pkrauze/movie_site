module Movies
  class ShowMovie
    def initialize(movie, order)
      @movie = movie
      @current_order = order
    end
    
    def call
      @order_item = @current_order.order_items.new
      genres = @movie.genres
      genre_ids = []
      
      genres.each do |g|
        genre_ids << [g.id]
      end
      @similar_movies = Movie.includes(:genres).where(genres:{id: genre_ids})
      
      return @order_item, @similar_movies
    end
  end
end