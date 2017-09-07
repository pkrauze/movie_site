<<<<<<< HEAD
class AddGenreToNotifications < ActiveRecord::Migration[5.1]
=======
class AddGenreToNotifications < ActiveRecord::Migration
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad
  def change
    add_column :notifications, :genre_id, :integer
  end
end
