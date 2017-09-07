<<<<<<< HEAD
class CreateRates < ActiveRecord::Migration[5.1]
=======
class CreateRates < ActiveRecord::Migration
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad

  def self.up
      create_table :rates do |t|
        t.belongs_to :rater
        t.belongs_to :rateable, :polymorphic => true
        t.float :stars, :null => false
        t.string :dimension
        t.timestamps
      end

<<<<<<< HEAD
      #add_index :rates, :rater_id
=======
      add_index :rates, :rater_id
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad
      add_index :rates, [:rateable_id, :rateable_type]
    end

    def self.down
      drop_table :rates
    end

end