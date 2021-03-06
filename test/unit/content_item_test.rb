require 'test_helper'

class ContentItemTest < ActiveSupport::TestCase
    
    def setup
        @content_item = content_items(:Post1)
        @user = users(:Dave)
    end

    test "content_item created" do
        assert_equal(@content_item.title, "Title1", "title not set correctly")
        assert_equal(@content_item.author.email, "dave@yahoo.com", "author not set correctly")
    end

    test "author should show content_item" do
        assert_not_nil(@user.content_items[0], "author not showing items")
    end

end
