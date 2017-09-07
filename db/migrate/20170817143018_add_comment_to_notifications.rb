<<<<<<< HEAD
class AddCommentToNotifications < ActiveRecord::Migration[5.1]
=======
class AddCommentToNotifications < ActiveRecord::Migration
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad
  def change
    add_column :notifications, :comment_id, :integer
  end
end
