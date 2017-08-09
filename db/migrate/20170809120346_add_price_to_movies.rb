class AddPriceToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :price, :decimal, :precision => 8, :scale => 2
  end
end
