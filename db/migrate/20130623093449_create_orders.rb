class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
			t.references :user
			t.text :address
			t.boolean :paid
			t.integer :sum
      t.timestamps
    end
  end
end
