<<<<<<< HEAD
class CreateAverageCaches < ActiveRecord::Migration[5.1]
=======
class CreateAverageCaches < ActiveRecord::Migration
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad

  def self.up
    create_table :average_caches do |t|
      t.belongs_to :rater
      t.belongs_to :rateable, :polymorphic => true
      t.float :avg, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :average_caches
  end

end

