class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :product, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.decimal12 :total_price
      t.decimal3 :total_price

      t.timestamps null: false
    end
  end
end
