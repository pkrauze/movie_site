module MoviesHelper
  
  def item_in_cart(movie)
    @movie_id = movie.id
    if OrderItem.find_by(movie_id: @movie_id)
      true
    else
      false
    end
  end
  
  def list_movie_genres(movie)
    genres = []
    movie.genres.each do |g|
      genres << [g.name.to_s]
    end
    
    return genres.join('/')
  end
end
