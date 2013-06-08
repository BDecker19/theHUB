require 'test_helper'

class LikeTest < ActiveSupport::TestCase
    
    def setup
        @like = likes(:Like1)
    end

    test "like created and associated with author and content_item" do
        assert_equal(@like.liked.title, "Title1", "Like not set to content_item")
        assert_equal(@like.liker.email, "dave@yahoo.com", "Like not set to user")
    end
end
