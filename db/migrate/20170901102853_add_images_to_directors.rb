<<<<<<< HEAD
class AddImagesToDirectors < ActiveRecord::Migration[5.1]
=======
class AddImagesToDirectors < ActiveRecord::Migration
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad
  def change
    add_column :directors, :images, :string
  end
end
