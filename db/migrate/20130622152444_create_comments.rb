class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
			t.references :user
			t.references :item
			t.text :message
      t.timestamps
    end
  end
end
