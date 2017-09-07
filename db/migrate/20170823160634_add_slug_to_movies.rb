<<<<<<< HEAD
class AddSlugToMovies < ActiveRecord::Migration[5.1][5.1]
=======
class AddSlugToMovies < ActiveRecord::Migration
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad
  def change
    add_column :movies, :slug, :string
  end
end
