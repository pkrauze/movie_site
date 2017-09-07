<<<<<<< HEAD
class AddSlugToGenres < ActiveRecord::Migration[5.1]
=======
class AddSlugToGenres < ActiveRecord::Migration
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad
  def change
    add_column :genres, :slug, :string
  end
end
