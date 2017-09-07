class AddMovieToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :movie_id, :integer
  end
end
