class AddGenreToNotifications < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :genre_id, :integer
  end
end
