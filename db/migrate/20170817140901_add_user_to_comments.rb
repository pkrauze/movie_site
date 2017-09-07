<<<<<<< HEAD
class AddUserToComments < ActiveRecord::Migration[5.1]
=======
class AddUserToComments < ActiveRecord::Migration
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad
  def change
    add_column :comments, :user_id, :integer
  end
end
