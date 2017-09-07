<<<<<<< HEAD
class CreateSubscribers < ActiveRecord::Migration[5.1]
=======
class CreateSubscribers < ActiveRecord::Migration
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad
  def change
    create_table :subscribers do |t|
      t.references :user, index: true, foreign_key: true
      t.references :director, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
