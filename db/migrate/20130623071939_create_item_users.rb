class CreateItemUsers < ActiveRecord::Migration
  def change
    create_table :item_users do |t|
			t.references :user
			t.references :item
			t.integer :quantity, :default => 1
      t.timestamps
    end
  end
end
