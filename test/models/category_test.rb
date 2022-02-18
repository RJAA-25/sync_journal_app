require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  test "should not create category without title" do
		category = Category.new(description: "description")
		assert_not category.save, "Created category without title"
	end

end
