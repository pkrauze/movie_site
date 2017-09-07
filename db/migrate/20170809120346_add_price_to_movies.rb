<<<<<<< HEAD
class AddPriceToMovies < ActiveRecord::Migration[5.1]
=======
class AddPriceToMovies < ActiveRecord::Migration
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad
  def change
    add_column :movies, :price, :decimal, :precision => 8, :scale => 2
  end
end
