class AddImagesToDirectors < ActiveRecord::Migration
  def change
    add_column :directors, :images, :json
  end
end
