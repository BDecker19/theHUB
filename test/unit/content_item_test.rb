require 'test_helper'

class ContentItemTest < ActiveSupport::TestCase
    
    def setup
        @content_item = content_items(:newsPost)
        @user = users(:Dave)
    end

    test "content_item created" do
        assert_equal(@content_item.title, "News Title", "title not set correctly")
        assert_equal(@content_item.author.email, "dave@yahoo.com", "author not set correctly")
    end

    test "author should show content_item" do
        binding.pry
        assert_not_nil(@user.content_items[0], "author not showing items")
    end

end
