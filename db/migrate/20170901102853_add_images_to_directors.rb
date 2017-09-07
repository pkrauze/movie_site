class AddImagesToDirectors < ActiveRecord::Migration[5.1]
  def change
    add_column :directors, :images, :string
  end
end
