<<<<<<< HEAD
class CreateDirectors < ActiveRecord::Migration[5.1]
=======
class CreateDirectors < ActiveRecord::Migration
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad
  def change
    create_table :directors do |t|
      t.string :firstname
      t.string :lastname
      t.integer :year_of_birth

      t.timestamps null: false
    end
  end
end
