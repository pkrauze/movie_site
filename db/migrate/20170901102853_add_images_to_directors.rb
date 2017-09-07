class AddImagesToDirectors < ActiveRecord::Migration
  def change
    add_column :directors, :images, :string
  end
end
