<<<<<<< HEAD
class AddImagesToGenres < ActiveRecord::Migration[5.1]
=======
class AddImagesToGenres < ActiveRecord::Migration
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad
  def change
    add_column :genres, :images, :string
  end
end
