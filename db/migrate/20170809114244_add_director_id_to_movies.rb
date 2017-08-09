class AddDirectorIdToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :director_id, :integer, index: true
  end
end
