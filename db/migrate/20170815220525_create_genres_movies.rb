<<<<<<< HEAD
class CreateGenresMovies < ActiveRecord::Migration[5.1]
=======
class CreateGenresMovies < ActiveRecord::Migration
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad
  def change
    create_table :genres_movies, :id => false do |t|
      t.column :genre_id, :integer
      t.column :movie_id, :integer
    end
  end
end
