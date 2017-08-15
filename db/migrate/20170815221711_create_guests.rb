class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :email
    end
  end
end
