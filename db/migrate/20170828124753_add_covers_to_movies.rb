<<<<<<< HEAD
class AddCoversToMovies < ActiveRecord::Migration[5.1]
=======
class AddCoversToMovies < ActiveRecord::Migration
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad
  def change
    add_column :movies, :covers, :string
  end
end
