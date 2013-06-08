require 'test_helper'

class LikeTest < ActiveSupport::TestCase
    
    def setup
        @like = likes(:Like1)
    end

    test "like created and associated with author and content_item" do
        assert_equal(@like.liked.title, "Title1", "Like not set to content_item")
        assert_equal(@like.liker.email, "dave@yahoo.com", "Like not set to user")
    end

    test "author should find associated likes" do
        @user = users(:Dave)
        assert_not_nil(@user.likes[0], "user not showing likes")
        puts "****user likes:****"
        @user.likes.each {|like| puts like.liked.title}
    end

    test "content_item should find associated likes" do
        @content_item = content_items(:Post1)
        assert_not_nil(@content_item.likes[0], "content_item not showing likes")
        puts "\n****content_item likes:****"
        @content_item.likes.each {|like| puts like.liker.email}
    end

end
