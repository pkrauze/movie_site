class AddCoversToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :covers, :string
  end
end
