module MoviesHelper
  
  def item_in_cart(movie)
    @movie_id = movie.id
    
    if OrderItem.find_by(movie_id: @movie_id)
      true
    else
      false
    end
  end
end
