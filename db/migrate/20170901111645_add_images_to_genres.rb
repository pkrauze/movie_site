class AddImagesToGenres < ActiveRecord::Migration
  def change
    add_column :genres, :images, :json
  end
end
