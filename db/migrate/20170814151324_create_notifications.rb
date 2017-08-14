class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :user, index: true, foreign_key: true
      t.references :director, index: true, foreign_key: true
      t.references :movie, index: true, foreign_key: true
      t.string :type
      t.boolean :read

      t.timestamps null: false
    end
  end
end
