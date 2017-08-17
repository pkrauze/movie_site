class AddGenreToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :genre_id, :integer
  end
end
