class AddCategoryToItem < ActiveRecord::Migration

	def up
		add_column :items, :category_id, :integer
		#change_column :items, :description, :text
	end

	def down
		remove_column :items, :category_id
		#change_column :items, :description, :string
	end


end
