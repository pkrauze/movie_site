class CreateDirectors < ActiveRecord::Migration
  def change
    create_table :directors do |t|
      t.string :firstname
      t.string :lastname
      t.integer :year_of_birth

      t.timestamps null: false
    end
  end
end
