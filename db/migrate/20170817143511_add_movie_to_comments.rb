<<<<<<< HEAD
class AddMovieToComments < ActiveRecord::Migration[5.1]
=======
class AddMovieToComments < ActiveRecord::Migration
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad
  def change
    add_column :comments, :movie_id, :integer
  end
end
