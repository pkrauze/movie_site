class AddPriceToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :price, :decimal, :precision => 8, :scale => 2
  end
end
