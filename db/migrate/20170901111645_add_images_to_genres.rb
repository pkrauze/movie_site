class AddImagesToGenres < ActiveRecord::Migration[5.1]
  def change
    add_column :genres, :images, :string
  end
end
