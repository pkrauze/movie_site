class CreateCartships < ActiveRecord::Migration
  def change
    create_table :cartships do |t|
      t.integer :cart_id
      t.integer :movie_id

      t.timestamps null: false
    end
  end
end
