require 'test_helper'

class ContentItemTest < ActiveSupport::TestCase
    
    def setup
        @content_item = content_items(:newsPost)
        @user = users(:dave)        
        @content_item.user_id = @user.id
        binding.pry
    end

    test "content_item created" do
        # assert_equal(@content_item.title, "News Title", "title not set correctly")
        # assert_equal(@content_item.user.email, "dave@yahoo.com", "user not set correctly")
    end

    test "author should show content_items" do
        assert_not_nil(@user.content_items[0], "Not finding content_item")
    end

end
