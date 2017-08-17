class AddGenresToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :genre_id, :integer
  end
end
