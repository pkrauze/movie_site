class AddGenresToSubscribers < ActiveRecord::Migration[5.1]
  def change
    add_column :subscribers, :genre_id, :integer
  end
end
