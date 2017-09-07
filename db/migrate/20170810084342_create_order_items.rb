<<<<<<< HEAD
class CreateOrderItems < ActiveRecord::Migration[5.1]
=======
class CreateOrderItems < ActiveRecord::Migration
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad
  def change
    create_table :order_items do |t|
      t.references :movie, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.decimal :total_price, :precision => 8, :scale => 2

      t.timestamps null: false
    end
  end
end
