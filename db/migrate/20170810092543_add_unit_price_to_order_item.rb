<<<<<<< HEAD
class AddUnitPriceToOrderItem < ActiveRecord::Migration[5.1]
=======
class AddUnitPriceToOrderItem < ActiveRecord::Migration
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad
  def change
    add_column :order_items, :unit_price, :decimal, :precision => 8, :scale => 2
  end
end
