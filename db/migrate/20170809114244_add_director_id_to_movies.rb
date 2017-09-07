<<<<<<< HEAD
class AddDirectorIdToMovies < ActiveRecord::Migration[5.1]
=======
class AddDirectorIdToMovies < ActiveRecord::Migration
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad
  def change
    add_column :movies, :director_id, :integer, index: true
  end
end
