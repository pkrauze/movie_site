class AddMovieCoverToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :movie_cover, :json
  end
end
