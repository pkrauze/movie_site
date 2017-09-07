class AddDirectorIdToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :director_id, :integer, index: true
  end
end
