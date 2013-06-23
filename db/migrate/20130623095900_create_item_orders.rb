class CreateItemOrders < ActiveRecord::Migration
  def change
    create_table :item_orders do |t|
			t.references :order
			t.references :item
			t.integer :quantity
			t.integer :price
      t.timestamps
    end
  end
end
