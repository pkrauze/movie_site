<<<<<<< HEAD
class CreateOrders < ActiveRecord::Migration[5.1]
=======
class CreateOrders < ActiveRecord::Migration
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad
  def change
    create_table :orders do |t|
      t.decimal :total, :precision => 8, :scale => 2
      t.references :order_status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
