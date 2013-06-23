require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

	test "Category Creation" do
		category = Category.new
		category.save
		assert_nil category.id

		category.name = "Something"
		category.save
		assert_not_nil category.id

	end

end
