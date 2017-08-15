class CreateGenresMovies < ActiveRecord::Migration
  def change
    create_table :genres_movies, :id => false do |t|
      t.column :genre_id, :integer
      t.column :product_id, :integer
    end
  end
end
