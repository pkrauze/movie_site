class RenameMovieCover < ActiveRecord::Migration
  def change
    rename_column :movies, :movie_cover, :cover
  end
end
