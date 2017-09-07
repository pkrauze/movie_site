<<<<<<< HEAD
class AddUserToNotifications < ActiveRecord::Migration[5.1]
=======
class AddUserToNotifications < ActiveRecord::Migration
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad
  def change
    add_column :notifications, :user_id, :integer
  end
end
