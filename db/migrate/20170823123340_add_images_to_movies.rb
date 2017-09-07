class AddImagesToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :images, :string
  end
end
