class AddImagesToGenres < ActiveRecord::Migration
  def change
    add_column :genres, :images, :string
  end
end
