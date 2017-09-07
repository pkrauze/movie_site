class CreateGenresMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :genres_movies, :id => false do |t|
      t.column :genre_id, :integer
      t.column :movie_id, :integer
    end
  end
end
