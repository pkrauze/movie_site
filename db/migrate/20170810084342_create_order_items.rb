class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :movie, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.decimal :total_price, :precision => 8, :scale => 2

      t.timestamps null: false
    end
  end
end
