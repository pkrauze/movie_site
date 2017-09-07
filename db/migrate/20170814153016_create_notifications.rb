<<<<<<< HEAD
class CreateNotifications < ActiveRecord::Migration[5.1]
=======
class CreateNotifications < ActiveRecord::Migration
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad
  def change
    create_table :notifications do |t|
      t.references :director, index: true, foreign_key: true
      t.references :movie, index: true, foreign_key: true
      t.string :notification_type
      t.boolean :read

      t.timestamps null: false
    end
  end
end
