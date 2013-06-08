require 'test_helper'

class ContentItemTest < ActiveSupport::TestCase
    
    def setup
        @content_item = content_items(:newsPost)
    end

    test "content_item created" do
        assert_equal(@content_item.title, "News Title", "title not set correctly")
        assert_equal(@content_item.author.email, "dave@yahoo.com", "author not set correctly")
    end
end
