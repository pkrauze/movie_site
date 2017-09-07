<<<<<<< HEAD
class CreateOrderStatuses < ActiveRecord::Migration[5.1]
=======
class CreateOrderStatuses < ActiveRecord::Migration
>>>>>>> 82221bfc01a0eceaad5c11677d9d799418fc7cad
  def change
    create_table :order_statuses do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
