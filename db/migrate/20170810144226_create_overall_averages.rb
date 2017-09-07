<<<<<<< HEAD
class CreateOverallAverages < ActiveRecord::Migration[5.1]
=======
class CreateOverallAverages < ActiveRecord::Migration
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad

  def self.up
    create_table :overall_averages do |t|
      t.belongs_to :rateable, :polymorphic => true
      t.float :overall_avg, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :overall_averages
  end

end

