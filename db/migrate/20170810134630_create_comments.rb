<<<<<<< HEAD
class CreateComments < ActiveRecord::Migration[5.1]
=======
class CreateComments < ActiveRecord::Migration
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :commentable_id
      t.string :commentable_type

      t.timestamps null: false
    end
  end
end
