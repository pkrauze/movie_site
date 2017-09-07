<<<<<<< HEAD
class CreateMovies < ActiveRecord::Migration[5.1]
=======
class CreateMovies < ActiveRecord::Migration
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad
  def change
    create_table :movies do |t|
      t.string :title
      t.text :desc
      t.integer :year
      t.integer :time

      t.timestamps null: false
    end
  end
end
