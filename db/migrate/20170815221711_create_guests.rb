<<<<<<< HEAD
class CreateGuests < ActiveRecord::Migration[5.1]
=======
class CreateGuests < ActiveRecord::Migration
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad
  def change
    create_table :guests do |t|
      t.string :email
    end
  end
end
